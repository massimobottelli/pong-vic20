10 printchr$(147):rem clrscr + reverse
20 poke36879,8:poke36878,15:rem black background + vol on
30 s=7680:c=38400:rem chr and col mem pos
40 x=2:y=11:dx=1:dy=-1+rnd(1)*2:rem start ball pos + random vert speed
50 xa=0:ya=11:xb=21:yb=11:rem start paddle pos
60 fori=-1to1:pokes+xa+22*(ya+i),160:pokec+xa+22*(ya+i),1:nexti:rem draw paddleA
70 fori=-1to1:pokes+xb+22*(yb+i),160:pokec+xa+22*(yb+i),1:nexti:rem draw paddleB

100 ifx<2orx>19thendx=-dx:gosub800:rem horizontal bounce + sound
110 ify<1ory>22thendy=-dy:gosub800:rem vertical bounce + sound
120 pokec+x+22*int(y+0.5),0:rem delete ball
130 x=x+dx:y=y+dy:rem increment x,y
140 pokes+x+22*int(y+0.5),81:rem print ball
145 gosub500:rem move paddleB
150 geta$:ifa$<>""thengosub200:rem detect key command

160 rem fort=1to100:nextt:rem slow down
170 ifx=1thenifpeek(s+x+22*int(y+0.5)-1)<>160thengoto900:rem detect fail paddleA
180 goto100:rem bounce on paddleA

200 rem move paddleA
210 ifasc(a$)=65thengosub300:rem a=paddleA up
220 ifasc(a$)=90thengosub400:rem a=paddleA down
230 return

300 rem paddleA up
310 v=xa+22*(ya+1):pokec+v,0:pokes+v,0:rem delete bottom
320 ya=ya-1:v=xa+22*(ya-1):pokes+v,160:pokec+v,1:rem draw top
330 return

400 rem paddleA down
410 v=xa+22*(ya-1):pokec+v,0:pokes+v,0:rem delete top
420 ya=ya+1:v=xa+22*(ya+1):pokes+v,160:pokec+v,1:rem draw bottom
430 return

500 rem paddleB
510 ifyb>int(y+0.5)thengosub600
520 ifyb<int(y+0.5)thengosub700
530 return

600 rem paddleB up
610 v=xb+22*(yb+1):pokec+v,0:pokes+v,0:rem delete bottom
620 yb=yb-1:v=xb+22*(yb-1):pokes+v,160:pokec+v,1:rem draw top
630 return

700 rem paddleB down
710 v=xb+22*(yb-1):pokec+v,0:pokes+v,0:rem delete top
720 yb=yb+1:v=xb+22*(yb+1):pokes+v,160:pokec+v,1:rem draw bottom
730 return

800 rem sound on bounce
810 poke36875,200
820 fort=1to15:nextt
830 poke36875,0
840 return

900 fort=1to1000:next:goto10
 
