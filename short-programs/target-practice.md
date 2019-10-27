# Target Practice

![image](media/target-practice.png "Target Practice Screenshot")

Target Practice is a solitaire version of the classic artillery game. Hit the red target ten times using as few shots as possible. The angle (ANG) is the elevation of the shot in degrees, and power (PWR) is the speed of the shot in meters per second. There is a constant slight (1 m/s) head wind that you'll have to contend with as well.

## Program

`0DIMY(140):POKE34,20:HOME:HCOLOR=7:FORU=7TO16:HGR:R=RND(1)*37:FORN=0TO139:T=INT(N/8)=U:Y(N)=149-R+COS(N*R*.001+R)*R:X=N*2:Y=Y(N):HPLOTX,0TOX+1,Y:HPLOTTOX+1,Y+5*T:NEXT:E=Y(20)-5:FORN=0TO4:HPLOT41-N,E+NTO41,E+N:NEXT:P=2000:FORQ=0TO1:P=P/2`

`1INPUT"ANG,PWR:";A,V:R=A*-.0175:C=COS(R)*V:D=SIN(R)*V:X=0:Y=0:FORT=0TO10STEP0.1:HPLOTX,Y:X=41+INT(C*T/2-T*T)*2:Y=E+D*T+9.8*T*T:I=X/2*(X>0ANDX<280):T=T+((Y>Y(I))+(X<0)+(X>279)+(Y<0))*15:NEXT:Q=INT(X/16)=U:NEXT:S=S+P:NEXT:?"SCORE:"INT(S)`
