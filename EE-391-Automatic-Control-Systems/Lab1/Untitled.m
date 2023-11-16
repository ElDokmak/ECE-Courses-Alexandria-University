Gsc = tf([100 40],[1 0]);
Gtc = tf([10 6],[1 0]);
Jtot =tf(1,[7.226 0]);
Kcs=0.5;
Kss=0.0433;
Ra=1;
Kf=0.1;
Kb=2;
Avo=0.6154;
nKt=1.8;
r=0.0615;

S1= feedback(Jtot,Avo*r);
S2=feedback(S1,Kf);
S3=series(S2,nKt);
S4=feedback(S3,Kb);
S5=series(S4,Gtc);
S6=feedback(S5,Kcs/S3);
S7=series(S6,Gsc);
S8=feedback(S7,Kss);
S9=series(S8,r);
minreal(S9)

