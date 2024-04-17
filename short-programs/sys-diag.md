# SYS.DIAG

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/sys-diag.png "SYS.DIAG Screenshot")

Apple II problems got you down? Run a quick system diagnostic!

## Program

`0SPEED=160:DEFFNA(I)=RND(1)*5+5*I:DIMA$(15):FORN=0TO14:READA$(N):NEXT:HOME:A$="ANALYZING...":GOSUB1:?:FORQ=0TO4:FORW=0TO500:NEXT:A$="YOUR "+A$(Q)+" "+A$(FNA(1))+" "+A$(FNA(2))+".":GOSUB1:NEXT:SPEED=255:END`

`1FORL=1TOLEN(A$):?MID$(A$,L,1);:INVERSE:?" ";CHR$(8);:NORMAL:NEXT:?" ":RETURN:DATA"CPU","RAM","KEYBOARD","MONITOR","DISK II","IS","IS QUITE","COULD BE","MIGHT BE","MUST BE","A MESS","YELLOW","A DISASTER","OVERRATED","FINE"`

## Discussion

[Apple II Software Enthusiasts Group Permalink](https://www.facebook.com/groups/418327412201896/posts/923311098370189/)
