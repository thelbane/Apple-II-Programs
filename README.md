# Short Programs

Select the **Project Link** below to view each project's details, including the program code. You can either copy and paste these programs into your favorite Apple II emulator _or_ enter them into your actual Apple II by hand, then type `RUN` to execute the program.

Programs with the ![1MHz: slow](https://img.shields.io/badge/1MHz-slow-red) badge will run perfectly fine on a 1MHz Apple II, but may take minutes or hours to execute. For these programs, I strongly recommend using an emulator at full speed or an accelerated Apple II.

| Project Link | Thumbnail |
| --- | --- |
{% for post in site.posts %}| [{{post.date | date: "%-d %B %Y"}} - {{post.title}}]({{post.url}})<br/>{{post.description}}<br/>{% include badges.md %} | [![{{post.title}}]({{post.thumbnail}})]({{post.url}}) |
{% endfor %}

### Download The Disk Image
The following image contains the above programs in a single, easy-to-use package.
* [short-programs.dsk](https://github.com/thelbane/Apple-II-Programs/raw/main/short-programs/short-programs.dsk) ![Download](images/download.png)<br>![incomplete](https://img.shields.io/badge/status-up--to--date-green)

### Tips & Tricks
If you're interested in writing your own one- and two-liners, I've compiled some [tips & tricks](tips-and-tricks.md) that you might find helpful.

# My Other Apple II Projects

## Game Boy Tetris for Apple II
I released an Apple II port of the Game Boy version of Tetris in late 2023. You can download the playable disk image and source code from one of the following locations.
* [MediaFire](https://www.mediafire.com/file/idnz38jba6kgsof/Game_Boy_Tetris_for_Apple_II_%2528src_incl%2529.zip/file) ![Leave](images/leave.png)
* [Apple Asimov](https://mirrors.apple2.org.za/ftp.apple.asimov.net/images/games/action/Game%20Boy%20Tetris%20for%20Apple%20II%20%28src%20incl%29.zip) ![Download](images/download.png)
* [Internet Archive](https://archive.org/details/gameboy_tetris_for_apple_ii) ![Leave](images/leave.png)<br>detailed instructions in comments

## Conway II
A pretty fast implementation of Conway's Game of Life cellular automaton on the Apple II.
* [GitHub Project](https://github.com/thelbane/ConwayII) ![Leave](images/leave.png)

# Community
Thank you for being one of the like fourteen people who really digs this retro stuff. If you have any problems with the programs in this repo, please let me know by creating an issue. I'm also aware that my one- and two-liners are very hacky and difficult to parse out. If there's a particular program you'd like to understand better, but you've hit a roadblock, let me know and I'll try to make time to add detailed dev notes.
