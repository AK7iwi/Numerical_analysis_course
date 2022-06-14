%TP 7 ex 1c

clear all; close all; clc;
f = @(x) 16*x.^5 -20*x.^3 + 5*x -1;
fp = @(x) 80*x^4 -60*x^2 +5;
x = -1.2:0.01:1.2;
plot(x,f(x))

a = 0.9;
b = 1.1;
tol = 1e-12;
res = 1e-12;

[x_dico it_dico] = dico(f,a,b,tol)
##x_dico = 1;
##it_dico = 1
[x_regfal it_regfal] = regfal(f,a,b,res,100)
##x_dico = 1.00000;
##it_dico = 25


%On détermine les deux autres racines 

x0 = -0.8
[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)
## x_newton = -0.80902
## it_newton = 16
## r_newton = 6.5636e-13
[x_newton_rl it_newton_rl r_newton_rl] = newton_rl(f,fp,x0,res,100)
## x_newton = -0.80902
## it_newton = 16
## r_newton = 6.5636e-13

x0 = 0.3
[x_newton_rl it_newton_rl r_newton_rl] = newton_rl(f,fp,x0,res,100)
## x_newton = 0.30902
## it_newton = 16
## r_newton = 2.5979e-13

