%% ***************** part a and b *************************
j = 600e3; B = 20e3; k = 1;
trans = tf(k, [j B k]);
rlocusplot(trans);
state = ss(trans);
info = stepinfo(ss(trans));

%% ***************** part d *************************
j = 600e3; B = 20e3; k = 1;
trans = tf(k, [j B k]);
info = stepinfo(ss(trans));
while info.Overshoot < 10
    k = k + 1;
    trans = tf(k, [j B k]);
    info = stepinfo(ss(trans));
end
max_k_overshot = k;

%% ***************** part e *************************
j = 600e3; B = 20e3; k = 1;
trans = tf(k, [j B k]);
info = stepinfo(ss(trans));
while info.RiseTime > 80
    k = k + 1;
    trans = tf(k, [j B k]);
    info = stepinfo(ss(trans));
end
max_k_risetime = k;

%% ***************** part f, g and h *************************
j = 600e3; B = 20e3; k = [200, 400, 1000, 2000, 381];
overshot = [];   risetime = []; ss_error = [];
for i=1:1:5
    trans = tf(k(i), [j B k(i)]);
    info = stepinfo(ss(trans));
    overshot(i) = info.Overshoot;
    risetime(i) = info.RiseTime;
    ss_error(i) = abs(1-(info.SettlingMax + info.SettlingMin)/2);
    figure(1);
    subplot(2,3,i);
    stepplot(trans); title(sprintf('Step response of k = %d',k(i)));
    figure(2);
    subplot(2,3,i);
    pzplot(trans); title(sprintf('Poles ans zeros of k = %d',k(i)));
end
%%
overshot;
risetime;
ss_error;

%% simulink part 
k = 1;
k = 2000;
