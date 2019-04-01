# Hello

A two-line _HELLO_ program that turns a DOS 3.3 disk CATALOG into a menu! Crazy!

## Program

`0:HOME:D$=CHR$(4):?D$"CATALOG":FORY=5TO24:VTABY:HTAB4:?"["CHR$(60+Y)"]":Y=Y+(PEEK(1024+1+(INT(Y/8)*40)+(Y/8-INT(Y/8))*1024)=160)*25:NEXT:C=Y-30:?:?"RUN [A-"CHR$(64+C)"]:";:FORN=0TO1:GETA$:N=A$>="A"ANDA$<CHR$(65+C):NEXT`

`1?A$:Y=ASC(A$)-61:M=1024+(INT(Y/8)*40)+(Y/8-INT(Y/8))*1024:VTABY+1:HTAB8:FORX=7TO36:C$=CHR$(PEEK(M+X)-128):POKE50,63+192*(C$=" "):?C$;:F$=F$+C$:NEXT:VTAB23:?:?D$CHR$(32+(PEEK(M+1)=194)*34)"RUN "F$`
