# Apple II Programs

Welcome to my little nerd space for Apple II programming! This repository contains a collection of short, creative programs written in AppleSoft BASIC - everything from one-liners to small games and visual experiments. While this is my personal playground for exploring the Apple II's capabilities, I've built it to be your little nerd space too. Whether you're a seasoned Apple II enthusiast or just discovering the magic of 8-bit computing, there's something here for everyone.

## 🌐 Visit the Website

The best way to experience this content is via **[apple2programs.com](https://www.apple2programs.com)** - a lovingly crafted site that showcases all these programs with beautiful formatting, interactive elements, and detailed explanations. The website makes it easy to browse, copy code, and dive deep into the fascinating world of Apple II programming.

## 📦 Download The Disk Image

Want to try these programs right away? Download the complete disk image containing all programs in a single, easy-to-use package:

* [short-programs.dsk](https://github.com/thelbane/Apple-II-Programs/raw/main/short-programs/short-programs.dsk) ![Download](images/download.png)<br>![incomplete](https://img.shields.io/badge/status-up--to--date-green)

## 📝 Tips & Tricks

If you're interested in writing your own one- and two-liners, I've compiled some [tips & tricks](docs/tips-and-tricks.md) that you might find helpful.

## 🤝 Contributing

While all the current articles are my own, I'd love to see this become a community space! If you have an Apple II program you'd like to share, here's how to submit it:

### Article Submission Guide

**File Structure:**
- Create your post in `docs/programs/_posts/` using the format: `YYYY-MM-DD-program-name.md`
- Add your source code to `docs/src/program-name.txt`
- Add images to `docs/media/` (see image requirements below)

**Required Front Matter:**
```yaml
---
layout: post
title: Your Program Name
description: Brief description of what your program does
tags: [program, one-liner/two-liner, 1mhz-ok/1mhz-slow]
date: YYYY-MM-DD
author: Your Name
screenshot: /media/your-program.gif
thumbnail: /media/your-program-tn.png
source: /src/your-program.txt
---
```

**Image Requirements:**
- **Screenshots:** PNG or GIF format, ideally showing the program in action
- **Thumbnails:** PNG format, 200x150 pixels (4:3 ratio)
- **File naming:** Use kebab-case (e.g., `my-awesome-program.png`, `my-awesome-program-tn.png`)

**Content Guidelines:**
- Keep descriptions clear and engaging
- Include gameplay instructions if applicable
- Mention any special hardware requirements
- Add the `1mhz-ok` tag if it runs well on 1MHz machines, `1mhz-slow` if it needs acceleration

**Code Requirements:**
- Programs should be in AppleSoft BASIC
- Include the complete, runnable code
- Test thoroughly in an emulator before submitting
- Keep programs reasonably short (under 50 lines preferred)

# My Other Apple II Projects

## Game Boy Tetris for Apple II
I released an Apple II port of the Game Boy version of Tetris in late 2022. You can download the playable disk image and source code from one of the following locations.
* [MediaFire](https://www.mediafire.com/file/idnz38jba6kgsof/Game_Boy_Tetris_for_Apple_II_%2528src_incl%2529.zip/file) ![Leave](images/leave.png)
* [Apple Asimov](https://mirrors.apple2.org.za/ftp.apple.asimov.net/images/games/action/Game%20Boy%20Tetris%20for%20Apple%20II%20%28src%20incl%29.zip) ![Download](images/download.png)
* [Internet Archive](https://archive.org/details/gameboy_tetris_for_apple_ii) ![Leave](images/leave.png)<br>detailed instructions in comments

## Conway II
A pretty fast implementation of Conway's Game of Life cellular automaton on the Apple II.
* [GitHub Project](https://github.com/thelbane/ConwayII) ![Leave](images/leave.png)

# Community
Thank you for being one of the like fourteen people who really digs this retro stuff. If you have any problems with the programs in this repo, please let me know by creating an issue. I'm also aware that my one- and two-liners are very hacky and difficult to parse out. If there's a particular program you'd like to understand better, but you've hit a roadblock, let me know and I'll try to make time to add detailed dev notes.

Ready to contribute? Fork this repo, add your program following the guidelines above, and submit a pull request. Let's make this the best Apple II programming community on the web! 🍎
