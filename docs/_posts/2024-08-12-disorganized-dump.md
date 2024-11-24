---
layout: post
title: Disorganized Dump
tags: updates, orphans
author: Lee Fastenau
---
Well well well... look what the cat dragged in. A small bunch of short programs without their own dedicated pages. Let's call these orphans until they can get their permanent home.
<!--more-->

## Ghost Clicker
Began as an experiment to see if easing functions for animation were sufficiently fast in Applesoft, then morphed into an 8-bit portal to the spectral plane.

### Versions 1.0
Draws lines on the hi-res screen, but with style and flare.
{% capture source_code -%}
10 HGR2
20 C=RND(1)*280:D=RND(1)*192:GOSUB 1000:A=C:B=D:GOTO 20
1000 X=A:Y=B:U=C-A:V=D-B:FORN=.2TO1STEP.2:E=1-(1-N)*(1-N):F=A+U*E:G=B+V*E:HCOLOR=3:HPLOTX,YTOF,G:H=X:I=Y:X=F:Y=G:NEXT:RETURN
{%- endcapture %}{% include applesoft.md src=source_code %}
### Version 1.1
Same as v1.0, but erases the tail for added drama.
{% capture source_code -%}
10 HGR2
20 C=RND(1)*280:D=RND(1)*192:GOSUB 1000:A=C:B=D:GOTO 20
1000 X=A:Y=B:U=C-A:V=D-B:FORN=.2TO1STEP.2:E=1-(1-N)*(1-N):F=A+U*E:G=B+V*E:HCOLOR=3:HPLOTX,YTOF,G:HCOLOR=0:HPLOTH,ITOX,Y:H=X:I=Y:X=F:Y=G:NEXT:RETURN
{%- endcapture %}{% include applesoft.md src=source_code %}
### Version 2.0
Instead of drawing lines, a mouse pointer zips around the screen, clicking randomly... as if guided by an unseen hand.
{% capture source_code -%}
0P=49200:HGR2:HCOLOR=3:FORN=768TO787:READS:POKEN,S:NEXT:POKE232,0:POKE233,3:ROT=0:SCALE=1:XDRAW1AT0,0:FORC=0TO999:C=RND(1)*271+2:D=RND(1)*180+1:U=C-A:V=D-B:FORN=0TO1STEP.08:E=1-(1-N)^3:X=A+U*E:Y=B+V*E:XDRAW1ATX,Y:XDRAW1ATH,I:H=X:I=Y:NEXT
1A=C:B=D:FORX=A-2TOA+6:HPLOTX,B-1TOX,B+10:NEXT:NEXT:DATA1,0,4,0,46,21,63,46,45,21,63,63,22,44,173,55,53,53,39,0,-1
{%- endcapture %}{% include applesoft.md src=source_code %}

## Adjectives
Did you know that consecutive adjectives have rules that dictate their order? Yeah, uh, me too. Anyway, this is sort of like V2.0 of the silly [SYS.DIAG](/programs/2022/02/10/sys-diag.html) program, but with more variety in component descriptions. It's also a lot longer.

Note: If your Apple supports 80-column mode, I recommend enabling it by typing `PR#3` before running the program.
{% capture source_code -%}
PR#3
0Q=8:DIMA$(Q,15),A(Q):FORN=0TOQ:FORM=0TO50:READA$(N,M):A(N)=M:M=M+(A$(N,M)="")*99:NEXTM,N
1HOME:FORP=0TOA(Q)-1:A=RND(1)*A(0):?A$(0,A)" ";:FORN=1TOQ-1:IFRND(1)>.5-RTHEN?A$(N,RND(1)*A(N))" ";:R=(N=2)+INT(RND(1)*(N=1)*2)*2:IFR=2THEN?"AND ";
2NEXT:?A$(Q,P);MID$("S",1,A>=1);".":NEXT:GETA$:?:GOTO1
999 END
1000 DATA "ONE","TWO","THREE","SEVERAL","A NUMBER OF","SOME","A THOUSAND",""
1010 DATA "SAD","SHINY","RUSTY","CREAKY","GLITCHY","SPEEDY","DEAD","LEAKY","MOLDY","CORRODED","WORTHLESS","PRICELESS",""
1015 DATA "STRANGELY","WEIRDLY","UNUSUALLY","ODDLY","TERRIBLY","WONDERFULLY","SURPRISINGLY",""
1020 DATA "LITTLE","BLOATED","TINY","BIG","LARGE","TALL","SHORT",""
1030 DATA "OLD","ANTIQUE","RETRO","MEDIEVAL","CLASSIC","PREHISTORIC","BRAND NEW","AFTERMARKET",""
1040 DATA "RECTANGULAR","BOXY","CYLINDRICAL","FLAT",""
1050 DATA "GREEN","DARK GRAY","YELLOW","BROWN","ORANGE","GUNMETAL","NEON","SICKLY",""
1060 DATA "PLASTIC","ALUMINUM","GLASS","SILICON","CARDBOARD","AMBER",""
1070 DATA "KEYBOARD","MONITOR","MEMORY MODULE","EXPANSION PORT","DISK CONTROLLER","SPEAKER","PROCESSOR","POWER SUPPLY UNIT",""
{%- endcapture %}{% include applesoft.md src=source_code %}

## Quine
Applesoft has a really elegant (too elegant if you ask me) quine program: `10 LIST`

When you run the above program, it outputs itself. That's essentially what a quine program is--a program that, given no other inputs, outputs itself.

Most programming languages require some mental gymnastics and clever coding to achieve this. If `10 LIST` didn't count, what would the next shortest Applesoft quine look like?

### Version 1.0
aka "It works!"
{% capture source_code -%}
10 B$="\10 B$=[Z[\20 FOR N = 1 TO LEN(B$)\30 C$ = MID$(B$,N,1)\40 C = ASC(C$) - 90\50 IF C = 0 THEN C$ = B$\60 IF C = 1 THEN C$ = CHR$(34)\70 IF C = 2 THEN C$ = CHR$(13)\80 PRINT C$;\90 NEXT\"
20 FOR N = 1 TO LEN(B$)
30 C$ = MID$(B$,N,1)
40 C = ASC(C$) - 90
50 IF C = 0 THEN C$ = B$
60 IF C = 1 THEN C$ = CHR$(34)
70 IF C = 2 THEN C$ = CHR$(13)
80 PRINT C$;
90 NEXT
{%- endcapture %}{% include applesoft.md src=source_code %}


### Version 1.1
aka "I smushed it into two lines!"

This one's similar to v1.0, but it does use the `POKE` if/else trick which is arguably cheating because it requires the program to live at a very specific memory address.
{% capture source_code -%}
0A$(0)=CHR$(34):A$(1)=CHR$(13):READB$:FORN=1TOLEN(B$):C$=MID$(B$,N,1):C=ASC(C$):POKE184,82+(C<91)*13:?A$(C-91);:NEXT:POKE184,113+(C<90)*7:?B$;:NEXT:?C$;:NEXT
1DATA"0A$(0)=CHR$(34):A$(1)=CHR$(13):READB$:FORN=1TOLEN(B$):C$=MID$(B$,N,1):C=ASC(C$):POKE184,82+(C<91)*13:?A$(C-91);:NEXT:POKE184,113+(C<90)*7:?B$;:NEXT:?C$;:NEXT\1DATA[Z[,KTHXBYE",KTHXBYE
{%- endcapture %}{% include applesoft.md src=source_code %}

### Version 2.0
aka "(Maybe) the second shortest Applesoft quine ever!"
{% capture source_code -%}
0READA$:A$=A$+CHR$(34):?A$A$:DATA"0READA$:A$=A$+CHR$(34):?A$A$:DATA"
{%- endcapture %}{% include applesoft.md src=source_code %}
