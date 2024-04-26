---
layout: post
title: Tower of Hanoi
description: Interactive puzzle game
tags: program two-liner 1mhz-ok
date: 2019-04-19
author: Lee Fastenau
screenshot: /media/tower-of-hanoi.gif
thumbnail: /media/tower-of-hanoi-tn.png
source: /src/tower-of-hanoi.txt
discussion:
    -
        name: Apple II Enthusiasts Group Permalink
        url: https://www.facebook.com/groups/5251478676/permalink/10158489147328677/
---

Yikes. Don't even ask me how I crammed this game into two lines. Modify the initial value of `H` to change the height of the tower.

The goal of this game is to move the stack of discs from the left side of the board (column 1) to the right side (column 3) in as few moves as possible. There are three rules though:

1. You may only move one disc at a time.
2. You may only take the topmost disc from any tower and place it on top of any other tower.
3. You may only place a smaller disc on top of a larger disc.

To move a disc, type 1, 2, or 3 on your keyboard to remove the topmost disc from the corresponding tower. Then type 1, 2, or 3 to place the disc onto a different tower, or back onto the tower from which it was removed. The game will prevent you from placing larger discs on top of smaller discs.