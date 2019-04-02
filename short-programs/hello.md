# Hello

![image](media/hello.gif "Hello GIF")

A two-line _HELLO_ program that turns a DOS 3.3 disk CATALOG into a menu! Crazy!

## Program

`0HOME:F=1024:D$=CHR$(4):?D$"CATALOG":FORY=5TO24:VTABY:HTAB4:?"["CHR$(60+Y)"]":Y=Y+(PEEK(F+1+(INT(Y/8)*40)+(Y/8-INT(Y/8))*F)=160)*25:NEXT:?:?"RUN [A-"CHR$(34+Y)"]:";:FORN=0TO1:GETA$:N=A$>="A"ANDA$<CHR$(35+Y):NEXT`

`1?A$:Y=ASC(A$)-61:M=F+(INT(Y/8)*40)+(Y/8-INT(Y/8))*F:VTABY+1:HTAB8:FORX=7TO36:C$=CHR$(PEEK(M+X)-128):POKE50,63+192*(C$=" "):?C$;:F$=F$+C$:NEXT:VTAB22:?:?D$CHR$(32+(PEEK(M+1)=194)*34)"RUN "F$`

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158434283573677/)
