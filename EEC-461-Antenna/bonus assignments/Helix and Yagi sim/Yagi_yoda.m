% Define plot frequency 
plotFrequency = 300000000;
% Define frequency range 
freqRange = (270:3:330) * 1e6;
% Define antenna 
antennaObject = yagiUda_antennaDesigner;
% show for yagiUda
figure;
show(antennaObject) 
% pattern for yagiUda
figure;
pattern(antennaObject, plotFrequency) 
% current for yagiUda
figure;
current(antennaObject, plotFrequency) 
% azimuth for yagiUda
figure;
patternAzimuth(antennaObject, plotFrequency) 
% elevation for yagiUda
figure;
patternElevation(antennaObject, plotFrequency) 

