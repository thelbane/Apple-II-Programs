# Sierpinski Triangle

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/sierpinski.gif "Sierpinski Triangle Screenshot")

A triangle made of triangles made of triangles made of triangles. What could be simpler?

## Program

```
0POKE184,22+(D=0)*210:H=H(C):X=X(C):Y=Y(C)+H:FORN=0TOH-1:Q=N*S:HPLOTX-Q,Y-NTOX+Q,Y-N:NEXT:POKE184,97+(C=D)*133:P(C)=-1:FORZ=0TO2:E=C+1:P=P(C):H(E)=H(C)/2:X=X(C):Y=Y(C):X(E)=X+H(C)*S*P:Y(E)=Y+H(E)*(ABS(P)*2-1):C=C+1:GOSUB0

1C=C-1:P(C)=P(C)+1:Z=P(C):NEXT:RETURN:D=4:S=.577:DIMX(D),Y(D),H(D),P(D):X(0)=139:Y(0)=95:H(0)=96:HGR2:HCOLOR=3:FORY=0TO191:Q=Y*S:HPLOT139-Q,YTO139+Q,Y:NEXT:HCOLOR=0:C=0:GOSUB0
```

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/posts/10163535442133677/)
