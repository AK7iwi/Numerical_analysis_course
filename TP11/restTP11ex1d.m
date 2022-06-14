%TP11 ex1d

clear all; close all; clc;

L_Te = log (2) /19;
L_I = log (2) /(6.7*3600) ;
L_Xe = log (2) /(9.2*3600) ;
A = [L_Te 0 0 ; ...
      -L_Te L_I 0;  ...
      0 -L_I  L_Xe] ;
f = @(t,y) -A*y;

y0 = [1;0;0];

T = 12*3600 ;
hstab = 2/ L_Te ;

%Plus h est grand, plus l'erreur est grande(perte de précision)
%On peut tolérer d'près l'énoncé une erreur de 5%
%Eulerp : on est limité par hstab
h = hstab;
t = 0:h:T;
yp = eulerp(f,y0,t);
[Nmax, indice] = max(yp(3,:)) ;
tmax = (indice -1)*h ; %car la première composante correspond à 0 c-a-d 0*h
% OU tmax = t(indice)
errN = abs(Nmax - 0.4275) / 0.4275
errt = abs(Nmax - 40606) / 40606
%Les valeurs ci_dessous étant inferieurs à 5% pour eulerp, on a hmax = hstab
##errN = 0.0024990
##errt = 0.00092143

h = 70*hstab;
t = 0:h:T;
yr = eulerr(f,y0,t);
[Nmax, indice] = max(yr(3,:));
tmax = (indice -1)*h;%car la première composante correspond à 0 c-a-d 0*h
% OU tmax = t(indice)
errN = abs(Nmax - 0.4275) / 0.4275
errt = abs(Nmax - 40606) / 40606
%Pour h = 39hstab, on a une erreur > 5% car errN = 0.025348 et errt = 0.053083
%Pour h = 70hstab, on a une erreur < 5% car errN = 0.043533 et ertt = 0.039582
%A cause de l'erreur sur t, la fonction nest pas croissante