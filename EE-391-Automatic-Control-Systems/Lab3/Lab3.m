%% Cruise Control using PID controllers
% Openloop system
m = 1000; b = 50;
Plant_Tf = tf(1, [m b]);
step(Plant_Tf);
info = stepinfo(ss(Plant_Tf)); 
%% Adjusting Kp to get RiseTime < 5sec
m = 1000; b = 50;
Plant_Tf = tf(1, [m b]);
Kp = 1;
C = pid(Kp);
TF = feedback(C*Plant_Tf, 1);
info = stepinfo(ss(TF));
while info.RiseTime > 5
    Kp = Kp + 1;
    C = pid(Kp);
    TF = feedback(C*Plant_Tf, 1);
    info = stepinfo(ss(TF));
end
max_Kp = Kp;
info;
step(TF)
%% no overshot then kd = 0;
%% Adjusting Ki to get Steady-state error < 2%
m = 1000; b = 50;
Plant_Tf = tf(1, [m b]);
Ki = 1; 
C = pid(390, Ki, 0);
TF = feedback(C*Plant_Tf, 1);
info = stepinfo(ss(TF));
ss_error = abs(1-(info.SettlingMax + info.SettlingMin)/2);
while ss_error > 0.02
    Ki = Ki + 1;
    C = pid(390, Ki, 0);
    TF = feedback(C*Plant_Tf, 1);
    info = stepinfo(ss(TF));
    ss_error = abs(1-(info.SettlingMax + info.SettlingMin)/2);
end
max_ki = Ki;
info;
step(TF)
%% Trying other values 
m = 1000; b = 50;
Plant_Tf = tf(1, [m b]);
C = pid(440, 67.3, 0);
TF = feedback(C*Plant_Tf, 1);
info = stepinfo(ss(TF));
step(TF)
%%