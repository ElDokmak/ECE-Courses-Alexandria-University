% Define plot frequency 
plotFrequency = 2100000000;
% Define frequency range 
freqRange = (1890:21:2310) * 1e6;
% Define antenna 
antennaObject = helix_antennaDesigner;
% show for helix
figure;
show(antennaObject) 
% pattern for helix
figure;
pattern(antennaObject, plotFrequency) 
% current for helix
figure;
current(antennaObject, plotFrequency) 
% azimuth for helix
figure;
patternAzimuth(antennaObject, plotFrequency) 
% elevation for helix
figure;
patternElevation(antennaObject, plotFrequency) 

