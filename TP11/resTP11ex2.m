%Tp11 ex 2µ

clear all; close all; clc;

%Vu la présence de termes V*P, ce système est non linéaire et ne s'écrit donc pas -A*y
% Le vecteur y des inconnus est
% y = [y(1) qui représente V
%      y(2)  qui représente P
% f le second membre est  aussi un vecteur colonne     

f = @(t,y)  [y(1) - 0.5*y(1)*y(2) ; 0.1*y(1)*y(2) - y(2)];

y0 = [1;1];

T = 20;
h = 0.01; %à modifier par essais-erreurs de facon à ce que les courbes eulerp et eulerr proches
t = 0:h:T;
yp = eulerp(f,y0,t);
yr = eulerr(f,y0,t);
plot(t,yp)
hold on
plot(t,yr)