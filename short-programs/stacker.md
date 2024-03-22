# Stacker

![image](media/stacker.gif "Stacker Gameplay GIF")

A two-line game inspired by the [Stacker arcade game](https://en.wikipedia.org/wiki/Stacker_(game)). To play, wait for the row that's moving back and forth to line up directly above the row below it and press any key to move on to the next row. Win the game by reaching the top of the screen with at least one block left.

_editor's note:_ This game is insanely difficult and it was sheer dumb luck that during the production of the preview animation above, Lee actually beat it. He has not since nor ever will achieve this feat ever again.

## Program

`0W=20:A$="********************":P=-16384:HOME:L=2:R=39:X=4:FORY=24TO1STEP-1:SPEED=245:P$=MID$(A$,1,W):VTABY:FORZ=0TO1:FORX=XTO37-W:HTABX:?" ";:?P$;:IFPEEK(P)<128THENNEXT:FORX=37-WTO4STEP-1:HTABX:?P$;:?" ";:IFPEEK(P)<128THENNEXT:Z=0:NEXT`

`1POKE49168,0:SPEED=255:HTABX:?SPC(W+2);:L=L+(L<X)*(X-L):R=R-(R>X+W-1)*(R-(X+W-1)):W=R-L+1:VTAB1:IFW>0THENVTABY:HTABL:?MID$(A$,1,W);:HTAB1:?Y;:X=INT(RND(1)*10)+4:NEXTY:HTAB1:?"YOU WIN!"`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10156649083593677/)
