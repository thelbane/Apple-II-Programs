# Geometric

![two-liner](https://img.shields.io/badge/two--liner-blue) ![1MHz: ok](https://img.shields.io/badge/1MHz-ok-green)

![image](media/geometric.png "Geometric Screenshot")

A geometric pattern to brighten anyone's day.

## Program

```
0HGR2:HCOLOR=3:P=3.1415927:Q=P/2:L=47:K=INT(95/L):R=SQR((L/2)^2*2):C=10:A=P/4:FORN=0TOC:D=(C-N)/C*R:FORM=0TO3:U(M)=COS(A+M*Q)*D:V(M)=SIN(A+M*Q)*D:NEXT:GOSUB1:A=A+0.15:NEXT:END

1B=1:FORS=-KTOK-1:FORT=-KTOK-1:X=140+S*L+L/2:Y=96+T*L+L/2:HPLOTX+U(0)*B,Y+V(0)TOX+U(1)*B,Y+V(1):HPLOTTOX+U(2)*B,Y+V(2):HPLOTTOX+U(3)*B,Y+V(3):HPLOTTOX+U(0)*B,Y+V(0):B=-B:NEXT:B=-B:NEXT:RETURN
```

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158507900298677/)
