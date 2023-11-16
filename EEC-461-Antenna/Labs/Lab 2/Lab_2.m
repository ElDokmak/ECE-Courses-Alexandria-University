%% names                       ID           Section
%  Ahmed Mahmoud ElDokmak      18010248     8
%  Mohamed Samir Abdelrhman    18011483     8
%  Mariam Hossam Eldin Saleh   18011752     8

%% Part 1 : Linear antenna (dipole of general lenght)
Lambda_     = 1;
Betta       = (2*pi)/Lambda_;
Theta       = linspace(-pi,pi,360); 
Phi         = linspace(-2*pi,2*pi,360);
L           = input('Enter The Lenght Of Dipole L, (L >1) : ');
L           = L * Lambda_;
En          = abs((cos( ( (Betta*L)/2 ).*cos(Theta)) - cos( ( (Betta*L)/2 )))./ sin(Theta));

% 2D Pattern
figure(1);
polar(Theta,En);
view([90,90]);
title('2D Pattern');

% 3D pattern
phi_3D      = meshgrid(Phi); 
Theta_3D    = meshgrid(Theta);
En_3D       = meshgrid(En);
X           = En_3D .* sin(Theta_3D) .* cos(phi_3D'); 
Y           = En_3D .* sin(Theta_3D) .* sin(phi_3D'); 
Z           = En_3D .* cos(Theta_3D);

figure(2);
surf(X,Y,Z); 
shading interp; 
axis vis3d; 
axis equal; 
lighting gouraud;
title('3D Pattern');

%% Part 2 : Uniform Linear Antenna Array(ULA) 
Lambda_     = 1;
Betta       = (2*pi)/Lambda_;
d           = input('Enter the spacing (d >=0 ) : ');
d           = d * Lambda_ ;
N           = input('Enter the number of elements N (N>=0) : ');
Alpha       = input('Enter the progressive phase shift alpha : ');
Gamma       = linspace(-pi,pi,6000);
Phi         = linspace(-2*pi,2*pi,6000);
Epsi        = Betta*d*cos(Gamma) + Alpha;
AF          = abs( sin((N*Epsi)/2) ./ (N*sin(Epsi/2)) );

% 2D pattern
figure(1);
plot(Epsi,AF);  title('Array factor vs Epsi');
xlabel('Epsi'); ylabel('AF');

figure(2);
polar(Gamma,AF); view([90,90]); title('2D pattern of Array');
xlabel('Gamma'); ylabel('AF');

% 3D patter 
Phi_3D    = meshgrid(Phi);
Gamma_3D  = meshgrid(Gamma);
AF_3D     = meshgrid(AF);
X         = AF_3D.*sin(Gamma_3D).*cos(Phi_3D'); 
Y         = AF_3D.*sin(Gamma_3D).*sin(Phi_3D'); 
Z         = AF_3D.*cos(Gamma_3D);

figure(3);
surf(X,Y,Z);
shading interp;
axis vis3d; 
lighting gouraud;
title('3D pattern of array');

%% Part 3 : Non-unifor Linear Arry 
%% A-Binomial Arrays
Lambda_     = 1;
Betta       = (2*pi) / Lambda_;
d           = input('Enter the spacing d (d>=0) : ');
N           = input('Enter the number of elements N (N>=0) : ');
Alpha       = input('Enter the progressive phase shift alpha : ');
Theta       = linspace(-pi,pi,6000);
Phi         = linspace(-2*pi,2*pi,6000);
U           = (Betta*d*cos(Theta) + Alpha) / 2;
AF          = abs(cos(U).^(N-1));

% 2D pattern
figure(1);
plot(U,AF); title('Array factor vs u');
xlabel('u'); ylabel('AF');

figure(2);
polar(Theta, AF);
view([90 90]);
title('2D pattern');

% 3D pattern
Phi_3D   = meshgrid(Phi);
Theta_3D = meshgrid(Theta);
AF_3D    = meshgrid(AF);
X        = AF_3D.*sin(Theta_3D).*cos(Phi_3D'); 
Y        = AF_3D.*sin(Theta_3D).*sin(Phi_3D'); 
Z        = AF_3D.*cos(Theta_3D);

figure(3);
surf(X,Y,Z);
shading interp;
axis vis3d;
axis equal;
lighting gouraud;
title('3D pattern');

%% B-Dolph-Tschebysceff Arrays
Lambda_     = 1;
Betta       = (2*pi) / Lambda_;
d           = input('Enter the spacing d (d>=0) : ');
N           = input('Enter the number of elements N (N>=0) : ');
Alpha       = input('Enter the progressive phase shift alpha : ');
M           = N - 1;
Ro          = input('Mainlobe to sidelobe level Ro (Ro>1) : ');
Zo          = cosh((1/M)*acosh(Ro));
Z           = linspace(-Zo,Zo,6000);
U_up        = acos(Z./Zo);
U_down      = -u_up;
U           = [U_down ; U_up];
Theta1      = acos(((2.*U_down)-Alpha)/(Betta*d));
Theta2      = -Theta1;
Phi         = linspace(-2*pi,2*pi,6000);
AF          = abs(cosh(M.*acosh(Z)));

% 2D Pattern
figure(1);
plot(Z,AF); title('Array factor vs Z');
xlabel('Z'); ylabel('Array factor');

figure(2);
polar(Theta1,AF);
hold on;
polar(Theta2, AF);
view([90 90]);
title('2D Pattern')

% 3D Pattern
Phi_3D   = meshgrid(Phi);
Theta_3D = meshgrid(Theta1);
AF_3D    = meshgrid(AF);
X        = AF_3D.*sin(Theta_3D).*cos(Phi_3D'); 
Y        = AF_3D.*sin(Theta_3D).*sin(Phi_3D'); 
Z        = AF_3D.*cos(Theta_3D);

figure(3);
surf(X,Y,Z);
shading interp;
axis vis3d;
axis equal;
lighting gouraud;
title('3D Pattern')