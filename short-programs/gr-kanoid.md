# GR-Kanoid

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green) ![notable](https://img.shields.io/badge/notable-gold)

![image](media/gr-kanoid.gif "GR-Kanoid Screenshot")

## 2020 Two-Liner Contest Submission

Lo-res breakout-style game implemented in just two lines of Applesoft. Requires joystick or paddle to control.

Dev Note: This game is not winnable in its current state. The ball doesn't support "paddle English" and can therefore get stuck in a pattern that will never hit any bricks. This was a conscious sacrifice I made in order to get it to fit into two lines, but I'm with you on this one... it's frustrating.

## Program

`0GR:COLOR=5:HLIN12,26AT9:VLIN9,38AT12:VLIN9,38AT26:COLOR=2:FORX=13TO25:VLIN10,38ATX:NEXT:FORF=14TO19:READC:COLOR=C:HLIN13,25ATF:NEXT:E=F:FORL=0TO2:HOME:?"LIVES:"2-L:A=.5:B=-1:X=19:Y=35:FORN=0TO38:P=PDL(0)/256*11+13:COLOR=2:HLIN13,25AT36`

`1COLOR=5:HLINP,P+2AT36:C=X+A:COLOR=2:PLOTE,F:P=SCRN(C,Y):A=A*((P=2)*2-1):COLOR=2+3*(P=5):PLOTC,Y:X=X+A:D=Y+B:P=SCRN(X,D):B=B*((P=2)*2-1):COLOR=2+3*(P=5):PLOTX,D:Y=Y+B:E=X:F=Y:COLOR=14:PLOTX,Y:N=Y:NEXT:?CHR$(7);:NEXT:DATA10,1,13,6,3,12`

## Discussion

[Apple II Software Enthusiasts Group Permalink](https://www.facebook.com/groups/418327412201896/posts/533623624005607/)
