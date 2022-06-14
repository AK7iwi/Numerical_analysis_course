%TP 11 ex1

clear all; close all; clc;

L_Te = log (2) /19;
L_I = log (2) /(6.7*3600) ;
L_Xe = log (2) /(9.2*3600) ;
A = [L_Te 0 0 ; ...
      -L_Te L_I 0;  ...
      0 -L_I  L_Xe] ;
f = @(t,y) -A*y;

y0 = [1;0;0];

T = 12*3600 ; %Etude du phénomène physique sur 12h
%Definissons hstab comme la limite de stabilité de la méthode d'eulerp
%c-a-d la valeur de h telle que h*beta = 2
hstab = 2/ L_Te ;

%3 cas de figure pour eulerp : stabilité avec ou sans oscillations ou instable

% Cas 1 : Stabilité sans oscillations : 49% de hstab conduit à h  t.q.   h*beta<1
h = 0.49*hstab;
t = 0:h:T;
yp = eulerp(f,y0,t);
figure(1)
plot(t,yp)

% Cas 2 : Stabilité sans oscillations : 99% de hstab conduit à h  t.q.   h*beta<2
h = 0.99*hstab;
t = 0:h:T;
yp = eulerp(f,y0,t);
figure(2)
plot(t,yp)

% Cas 3 : Stabilité sans oscillations : 101% de hstab conduit à h  t.q.   h*beta>2
h = 1.01*hstab;
t = 0:h:T;
yp = eulerp(f,y0,t);
figure(3)
plot(t,yp)

%Euler inconditionnellement stable
h = 5*hstab;
t = 0:h:T;
yr = eulerr(f,y0,t);
figure(4)
plot(t,yr)
