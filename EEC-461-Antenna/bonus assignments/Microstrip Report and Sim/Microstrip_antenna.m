%% name                       ID          
%  Ahmed Mahmoud ElDokmak      18010248     

%%
PMS=patchMicrostrip; 
PMS=patchMicrostrip('Length',75e-3,'Width',37e-3,'GroundPlaneLength',120e-3,'GroundPlaneWidth',120e-3);
show(PMS)
pause(2);
%Create and view a microstrip patch with specified parameters.
d=dielectric('FR4');
PMS=patchMicrostrip('Length',75e-3,'Width',37e-3, 'GroundPlaneLength',120e-3,'GroundPlaneWidth',120e-3,'Substrate',d);
figure; show(PMS)
pause(2);
%Create a microstrip patch antenna using 'FR4' as the dielectric substrate.
figure; pattern(PMS,1.67e9)
pause(2);
%Plot the radiation pattern of the antenna at a frequency of 1.67 GHz
d = dielectric('FR4');
PMS=patchMicrostrip('Substrate',d); 
figure; show(PMS)
%Create a microstrip patch antenna using 'FR4' as the dielectric substrate. 
figure; impedance(PMS,linspace(0.5e9,1e9,11));
%Calculate and plot the impedance of the antenna over the specified frequency range
%%