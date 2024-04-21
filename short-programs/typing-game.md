# Typing Game

![one-liner](https://img.shields.io/badge/one--liner-orange) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/typing-game.gif "Typing Game GIF")

Type each letter before it collides with the prompt! Make sure `Caps Lock` is enabled before playing.

## Program

```
0HOME:?"]";:L$=CHR$(8):FORN=19TO0STEP-1:C=INT(RND(1)*26)+65:HTAB25:FORX=23TO1STEP-1:?" "L$L$CHR$(C)L$;:FORW=0TON*4:NEXT:P=X:X=X-((PEEK(-16384)-128)=C)*X:NEXT:N=N*-X:S=S+(1-X)*P:D=D-1:?MID$(" ",1,-X);:POKE-16368,0:NEXT:?:?"SCORE:"SCHR$(7)
```

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158450424933677/)
