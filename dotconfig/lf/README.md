<div align="center">
 <h1>ultimate lf</h1>
 <p>my config files for a powerful and easy to use terminal file manager using lf</p>
</div>

# screenshots
 
 <div align="center">
 <p><img width=100% src="/screenshots/lf_screenshot1.png"/></p>
 </div>

# features

 - image previews
 - progress indicator while copying/moving
 - sensible keybinds (kind of. everyone has its preferences...)
 - structured config files to easily edit keymaps or functions
 - bulk rename files
 - create: directories, files, symlinks, playlists
 - change file permissions
 - convert files to mp4, gif, mp3, png or jpg
 - create and extract archive files
 - set default app for file types
 - tabs (kind of experimental)
 - drag and drop
 - recycle bin

<details>
  <summary>and more...</summary>
  
 - auto sort for specified directories
 - automatic adjustment to terminal size
 - copying file name in different formats
 - open in gui/terminal application
 - compare 2/4 videos side by side
 - copy text from image
 - git info

</details>

# dependencies

<p><b>essential</b></p>

packages:

 - [ctpv](https://github.com/NikitaIvanovV/ctpv) to preview images (it is recommended to use the kitty terminal for this. otherwise you have to configure it yourself)
 - [rsync](https://github.com/RsyncProject/rsync) to copy and move files
 - [trash-cli](https://github.com/sindresorhus/trash-cli) to use the recycle bin
 - [wl-clipboard](https://github.com/bugaevc/wl-clipboard) to use the clipboard
 - [pipe-rename](https://github.com/marcusbuffett/pipe-rename) to bulk rename files
 - [zip](https://infozip.sourceforge.net/Zip.html) to handle zip files
 - [p7zip](https://github.com/p7zip-project/p7zip) to handle 7z files
 - [tar](https://www.gnu.org/software/tar/) to handle tar.* files
 - [perl-file-mimeinfo](https://github.com/mbeijen/File-MimeInfo) to declare default apps to open certain file types
 - [dragon-drop](https://github.com/mwh/dragon) to drap and drop files
 - [tmux](https://github.com/tmux/tmux) to use tabs
 - [ffmpeg](https://github.com/FFmpeg/FFmpeg) to convert files

files:

 - [.bashrc](https://github.com/cafreo/hyprland-intergalactic/blob/main/.bashrc) for some easy defaults
 - [mimeapps.list](https://github.com/cafreo/hyprland-intergalactic/blob/main/dotconfig/mimeapps.list) for set default apps

<details>
  <summary><b>optional</b></summary>

packages:

 - [kitty terminal](https://github.com/kovidgoyal/kitty) for native image support in terminal
 - [udiskie](https://github.com/coldfix/udiskie) to mount usb devices
 - [git](https://github.com/git/git) to show git information and pull changes
 - [mpv](https://github.com/mpv-player/mpv) to display multiple videos simultaneously
 - [tesseract](https://github.com/tesseract-ocr/tesseract) to detect text in images
 - [fzf](https://github.com/junegunn/fzf) to fuzzy find files

files: 

 - [.dircolors](https://github.com/cafreo/hyprland-intergalactic/blob/main/.dircolors) for the colorscheme
 - [ctpv config file](https://github.com/cafreo/hyprland-intergalactic/tree/main/dotconfig/ctpv) for preview adjustments

</details>

 # to do
 - [ ] paste: ask if files should be overwritten
 - [ ] rename: autocomplete
 - [ ] archives: extract multiple archives at once
 - [ ] tabs: fix image preview not working in tmux

# credits
thanks to [eric murphy](https://github.com/ericmurphyxyz), [luke smith](https://github.com/LukeSmithxyz), & [brodie robertson](https://github.com/BrodieRobertson), for showcasing lf and some config options in their videos and [learn linux tv](https://www.youtube.com/channel/UCxQKHvKbmSzGMvUrVtJYnUA) for his [bash scripting tutorial series](https://www.youtube.com/playlist?list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w) and all the developers of the projects that are listed above.
