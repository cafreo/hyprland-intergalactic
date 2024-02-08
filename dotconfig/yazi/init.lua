function Manager:render(area)
        local chunks = self:layout(area)
        local bar = function(c, x, y)
                x, y = math.max(0, x), math.max(0, y)
                return ui.Bar(ui.Rect({ x = x, y = y, w = ya.clamp(0, area.w - x, 1), h = math.min(1, area.h) }), ui.Bar.TOP)
                                :symbol(c)
        end
        return ya.flat({
                -- Borders
                ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED),
		--ui.Border(area, ui.Border.ALL):style(fg("#FFFFFF"):bg("#FFFFFF")),
                ui.Bar(chunks[1], ui.Bar.RIGHT),
                ui.Bar(chunks[3], ui.Bar.LEFT),
                bar("┬", chunks[1].right - 1, chunks[1].y),
                bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
                bar("┬", chunks[2].right, chunks[2].y),
                bar("┴", chunks[2].right, chunks[1].bottom - 1),
                -- Parent
                Parent:render(chunks[1]:padding(ui.Padding.xy(1))),
                -- Current
                Current:render(chunks[2]:padding(ui.Padding.y(1))),
                -- Preview
                Preview:render(chunks[3]:padding(ui.Padding.xy(1))),
        })
end

function Status:name()
	local h = cx.active.current.hovered
	if h == nil then
		return ui.Span("")
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Span(" " .. h.name .. linked)

end

function Status:owner()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ui.Line {}
	end

	return ui.Line {
		ui.Span(" "),
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("#C8CACC"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("#C8CACC"),
		ui.Span(" "),
	}
end

function Status:permissions()
	local h = cx.active.current.hovered
	if h == nil then
		return ui.Line {}
	end

	local perm = h.cha:permissions()
	if perm == nil then
		return ui.Line {}
	end

	local spans = {}
	for i = 1, #perm do
		local c = perm:sub(i, i)
		local style = THEME.status.permissions_t
		if c == "-" then
			style = THEME.status.permissions_s
		elseif c == "r" then
			style = THEME.status.permissions_r
		elseif c == "w" then
			style = THEME.status.permissions_w
		elseif c == "x" or c == "s" or c == "S" or c == "t" or c == "T" then
			style = THEME.status.permissions_x
		end
		spans[i] = ui.Span(c):style(style)
	end
	return ui.Line(spans)
end

function Status:render(area)
	self.area = area

	local left = ui.Line { self:mode(), self:size(), self:name() }
	local right = ui.Line { self:permissions(), self:owner(), self:percentage(), self:position() }
	return {
		ui.Paragraph(area, { left }),
		ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
		table.unpack(Progress:render(area, right:width())),
	}
end

function Header:host()
	if ya.target_family() ~= "unix" then
		return ui.Line {}
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("#CB2211"):bold(true)
end

function Header:render(area)
	local chunks = self:layout(area)

	local left = ui.Line { self:host(), self:cwd() }
	local right = ui.Line { self:tabs() }
	return {
		ui.Paragraph(chunks[1], { left }),
		ui.Paragraph(chunks[2], { right }):align(ui.Paragraph.RIGHT),
	}
end
