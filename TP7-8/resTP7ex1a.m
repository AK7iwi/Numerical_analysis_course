%TP 7 ex 1a

clear all; close all; clc;
f = @(x) besselj(0,x)
x = 2: 0.01:3;
plot(x,f(x))
a = 2.3;
b = 2.5;

tol = 1e-12;
res = 1e-12;
[x_dico it_dico] = dico(f,a,b,tol)
[x_regfal it_regfal] = regfal(f,a,b,res,100)
%Résultats :
## x_dico = 2.4048
## it_dico = 38
## x_regfam = 2.4048
## it_regfal = 7
%La méthode de la fausse position converge en moins d'itération
% N.B : les critères d'arrêts ne sont pas les mêmes
