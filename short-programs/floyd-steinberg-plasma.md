# Floyd-Steinberg Plasma

![one-liner](https://img.shields.io/badge/one--liner-orange) ![1MHz: slow](https://img.shields.io/badge/1MHz-slow-red)

![image](media/floyd-steinberg-plasma.jpg "Floyd-Steinberg Plasma")

Floyd-Steinberg dithering algorithm implemented in one line of Applesoft.

## Program
```
0DIMA(2,281):HGR2:FORY=0TO191:T=1-T:FORX=0TO279:V=(SIN(Y/9)+SIN(X/9)+2)/4+A(T,X+1):Q=V>=0.5:E=V-Q:A(T,X+1)=0:A(T,X+2)=A(T,X+2)+E*.4:A(1-T,X)=A(1-T,X)+E*.2:A(1-T,X+1)=A(1-T,X+1)+E*.3:A(1-T,X+2)=A(1-T,X+2)+E*.1:HCOLOR=Q*3:HPLOTX,Y:NEXT:NEXT
```

## Discussion

[Apple II Enthusiasts Group Permalink](https://www.facebook.com/groups/5251478676/permalink/10158230715378677/)
