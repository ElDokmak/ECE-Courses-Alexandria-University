%% name                       ID          
%  Ahmed Mahmoud ElDokmak      18010248 
%%
% Define plot frequency 
plotFrequency = 15000000000;
% Define frequency range 
freqRange = (13.5:0.15:16.5) * 1e9;
% Define antenna 
antennaObject = horn_antennaDesigner;
% show for horn
figure;
show(antennaObject) 
% pattern for horn
figure;
pattern(antennaObject, plotFrequency) 
% azimuth for horn
figure;
patternAzimuth(antennaObject, plotFrequency) 
% current for horn
figure;
current(antennaObject, plotFrequency) 
% elevation for horn
figure;
patternElevation(antennaObject, plotFrequency) 
%%
