return {
    "s1n7ax/nvim-search-and-replace",
    config = function()
    require'nvim-search-and-replace'.setup({
	-- save the changes after replace
     	update_changes = false,

	-- keymap for search and replace
	replace_keymap = '<C-l>',
        -- keymap for search and replace ( this does not care about ignored files )
        replace_all_keymap = '<C-S-l>',
        -- keymap for search and replace
        replace_and_save_keymap = '<leader>gu',
        -- keymap for search and replace ( this does not care about ignored files )
        replace_all_and_save_keymap = '<leader>gU',
    })
    end,
}
