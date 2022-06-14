%TP 7 ex 1b

clear all; close all; clc;
f = @(x) exp(-x.^2+22*x-120)-0.5;
fp = @(x) (-2*x +22).*exp(-x.^2+22*x-120);
x = 0:0.01:14;
plot(x,f(x))

a = 9.5;
b = 10;
tol = 1e-12;
res = 1e-12;
x0 = 9.7;

[x_dico it_dico] = dico(f,a,b,tol)
[x_regfal it_regfal] = regfal(f,a,b,res,100)

%Résultats :
## x_dico = 9.6988
## it_dico = 39
## x_regfam = 9.6988
## it_regfal = 18
%La méthode de la fausse position converge en moins d'itération

[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)

## x_newton = 9.6988
## it_newton = 3
## r_newton = 1.5155e-14

x0 = 9.7;

[x_newton_rl it_newton_rl r_newton_rl] = newton_rl(f,fp,x0,res,100)

## x_newton = 9.6988
## it_newton = 3
## r_newton = 1.5155e-14

