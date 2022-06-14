%Tp11 ex 2�

clear all; close all; clc;

%Vu la pr�sence de termes V*P, ce syst�me est non lin�aire et ne s'�crit donc pas -A*y
% Le vecteur y des inconnus est
% y = [y(1) qui repr�sente V
%      y(2)  qui repr�sente P
% f le second membre est  aussi un vecteur colonne     

f = @(t,y)  [y(1) - 0.5*y(1)*y(2) ; 0.1*y(1)*y(2) - y(2)];

y0 = [1;1];

T = 20;
h = 0.01; %� modifier par essais-erreurs de facon � ce que les courbes eulerp et eulerr proches
t = 0:h:T;
yp = eulerp(f,y0,t);
yr = eulerr(f,y0,t);
plot(t,yp)
hold on
plot(t,yr)