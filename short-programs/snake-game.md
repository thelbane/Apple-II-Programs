# Snake Game

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/snake-game.gif "Snake Game GIF")

It's actually more of a "light cycle game" than a "snake game" because your tail just keeps growing infinitely long without having to eat anything. Use the left and right arrow keys to turn.

## Program

```
0HOME:X=11:Y=X:A=1:INVERSE:FORN=1TO39:VTAB1:HTABN:?"/";:VTAB23:?"/";:VTAB((N-1)/39)*22+1:HTAB40:?"//";:NEXT:FORN=0TO1:VTABY+1:HTABX+1:?" ";:X=X+A:Y=Y+B:IFPEEK(-16384)>127THENGETA$:C=B:B=A:A=-C:IFASC(A$)=8THENA=-A:B=-B

1S=S+1:VTAB1:HTAB1:?S:N=PEEK(1024+X+(INT(Y/8)*40)+(Y/8-INT(Y/8))*1024)<>160:NEXT:VTABY+1:HTABX+1:?"*";CHR$(7):VTABY+1:HTABX+1:FORN=0TO1000:NEXT:POKE-16368,0:GETA$:NORMAL:HOME:IFASC(A$)<>27THENRUN
```

## Discussion

[Apple II Game Programming Group Permalink](https://www.facebook.com/groups/AppleIIGameProgramming/permalink/1301339963260428/) (original posting)

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158357623863677/)
