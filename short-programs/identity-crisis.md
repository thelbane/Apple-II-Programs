# Identity Crisis

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/identity-crisis.png "Identity Crisis Screenshot")

This Mac thinks it's an Apple II. Wait. No...

## Program

```
0A$="2D40D030F0602@209010@0109010@0109010@010B0103020203010B0103020203010<010707010<010707010<0106170109010@010?01040305010<0105360109010@0109010@010602@2030F030F030F030F09011952030F030F030F030F01F40D040D040D01F":P=1:HGR2

1HCOLOR=6:HPLOT0,0:CALL-3082:FORY=31TO62:C=4:I=ASC(MID$(A$,P,1))-48:J=INT(I/3):X=114+(I-J*3)*2:FORM=PTOP+J*2:HCOLOR=C:C=11-C:S=2*(ASC(MID$(A$,M+1,1))-47):HPLOTX,Y*2TOX+S-1,Y*2:HPLOTX,Y*2+1TOX+S-1,Y*2+1:X=X+S:P=P+1:NEXT:P=P+1:NEXT
```

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/posts/10163502202643677/)
