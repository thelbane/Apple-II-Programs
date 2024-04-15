# Fifteen Puzzle

![image](media/fifteen-puzzle.gif "Fifteen Puzzle Screenshot")

Controls are I, J, K, and L (all CAPS) to slide tiles up, left, down, and right, respectively. To win, move all the tiles into ascending numerical order leaving the empty tile in the bottom-rightmost position.

## Program

`0POKE184,21+(Z=0)*84:POKE50,63+192*(N=P):R%=N/4:HTAB3*(N-R%*4)+1:VTAB2*R%+1:A$=STR$(T(N))+"   ":?MID$(A$,1+(N=P)*2,2):RETURN:Z=1:HOME:DIMT(16):FORN=0TO15:T(N)=N:NEXT:N=INT(RND(1)*14)+1:T(N)=N+1:T(N+1)=N:FORN=0TO15:GOSUB0:NEXT`

`1FORT=0TO14:POKE184,216+(T(T)<>T+1)*4:NEXT:END:GETA$:A=ASC(A$):K=A>72ANDA<78:X=-SGN(A-75)*(A<>73)*K:Y=-SGN(A-74)*(A<>76)*K:R%=P/4:C=P-R%*4:C=C+X*(ABS(C+X-1.5)<2):R%=R%+Y*(ABS(R%+Y-1.5)<2):Q=R%*4+C:T(P)=T(Q):N=P:P=Q:GOSUB0:N=P:GOSUB0:GOTO1`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/posts/10163552518708677/)
