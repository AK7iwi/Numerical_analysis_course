%Examen 18-19 S2 Q3

clear all; close all; clc;

f= @(x) x.^4 - 4 * x.^2 + x + 2.019 ;
fp = @(x) 4 * x.^3 - 8 * x +1;
x = -3:0.01: 3;
plot(x,f(x))

res = 1e-12;

x0 = -2
[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)

x0 = -0.6
[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)

x0 = 1
[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)

x0 = 1.6
[x_newton it_newton r_newton] = newton(f,fp,x0,res,100)




