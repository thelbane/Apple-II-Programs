# Sprite

![image](media/sprite.png "Sprite Screenshot")

It's everyone's favorite vacuum cleaner-inspired puffball!

## Program

`0?CHR$(17):A=124:B=80:HGR2:HCOLOR=6:HPLOT0,0:CALL-3082:D$="?&>)>%>>$1K1$1N1$2$$1M1P1$K$$V1K$$1Q$K$M$>$1P$K$L1$>%1O$K$L$>>$1M2O1$>>$1U$>?$Q$L1$>?$1S$?>$1$1Q1$?>$2%1M2$@>$3*A>$2$>$2$C?%@%"`

`1FORM=1TO126:D=ASC(MID$(D$,M,1))-35:C=INT(D/13):HCOLOR=C+4:FORN=1TOD-C*13:HPLOTA+X,B+YTOA+X+1,B+Y:HPLOTA+X,B+Y+1TOA+X+1,B+Y+1:X=(X+2)*(X<30):Y=Y+(X=0)*2:NEXT:NEXT`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158453667263677/)