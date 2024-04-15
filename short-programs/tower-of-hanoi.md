# Tower of Hanoi

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/tower-of-hanoi.gif "Tower of Hanoi GIF")

Yikes. Don't even ask me how I crammed this game into two lines. Modify the initial value of `H` to change the height of the tower.

The goal of this game is to move the stack of discs from the left side of the board (column 1) to the right side (column 3) in as few moves as possible. There are three rules though:

1. You may only move one disc at a time.
2. You may only take the topmost disc from any tower and place it on top of any other tower.
3. You may only place a smaller disc on top of a larger disc.

To move a disc, type 1, 2, or 3 on your keyboard to remove the topmost disc from the corresponding tower. Then type 1, 2, or 3 to place the disc onto a different tower, or back onto the tower from which it was removed. The game will prevent you from placing larger discs on top of smaller discs.

## Program

`0H=8:DIMT(3,H):HGR:HOME:D=1:FORY=0TOH-1:T(X,Y)=H-Y:H(X)=Y+1:GOSUB1:NEXT:FORD=0TO1:FORQ=0TO1:GETA$:X=ASC(A$)-1:X=X-INT(X/3)*3:Q=H(X)>-DANDT*D<=V(X):NEXT:T(X+(1-D)*(3-X),H(X))=T:H(X)=H(X)+D:GOSUB1:H(X)=H(X)-1+D:D=D-(D=1)*2*(H(2)<H):NEXT:END`

`1Y=H(X)-1:T=T(X,Y):C=T-INT(T/5)*5+1:C=C+(C>3):HCOLOR=C*D:A=X*(134-H*4)+H*4:Z=T(X,Y)*4:FORB=0TO4:HPLOTA-Z,156-Y*6-BTOA+Z,156-Y*6-B:NEXT:HCOLOR=3:HPLOT0,158TO279,158:VTAB21:FORI=0TO2:?"   "I+1,:Z=H(I)-1:V(I)=T(I,Z+(Z<0))+(Z<0)*9:NEXT:RETURN`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158489147328677/)
