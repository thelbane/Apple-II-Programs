# Driving

![one-liner](https://img.shields.io/badge/one--liner-orange) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/driving.gif "Driving GIF")

Buckle up! It's gonna be a bumpy ride!

Press the spacebar to activate hyperjets and jump over the obstacles. This game features high-quality 5.1 Dolby Surround Sound[^1] that will make your neighbors call the cops.

## Program

`0HOME:?:?:FORN=0TO39:?"=";:A$=A$+"﻿ ":NEXT:FORN=0TO1:N=0:VTAB1:?"﻿ ﻿ ﻿ ﻿ ":?A$S:VTAB2-(J>N):?"﻿ O=o":POKE49200-(J=16)*32,N:IFMID$(A$,3,2)="﻿ ﻿ "ORJTHENJ=J+((J<1)*(PEEK(49152)>127)*16)-(J>N):A$=MID$(A$,2,39)+CHR$(32+(RND(1)<.1)*3):S=S+1:NEXT`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10156679023638677/)

---

[^1]: Clicks. It clicks the Apple II speaker. It sounds nothing like a real car. It's all lies.
