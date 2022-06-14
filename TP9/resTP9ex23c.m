% TP9 ex2c,3c

clear all; close all; clc;
a = 1e-7  ;
b = pi ; 
f = @(x) sin(x)/x ;
fpp = @(x) (-2*x.*cos(x) + (2-x.^2).*sin(x)) ./ x.^3 ; 
x = a :0.01 : b ;
plot(x,abs(fpp(x)))
c = 1e-7;
Majorant = abs(fpp(c)) ;
h = sqrt(12e-6 / (b-a) /  Majorant) ;
n = ceil((b-a)/h) ; %ceil = arrondi supérieur (plafond)
% floor = arrondi inferieur (plancher)
format long
int_trapeze = itg_trp(f,a,b,n)
int_simpson = itg_smp(f,a,b,n)
int_reference = quad(f,a,b) %"fais office de solution exacte"
format short
err_trapeze = abs(int_trapeze - int_reference)
err_simpson = abs(int_simpson - int_reference)

%Resultats
##int_trapeze = 1.851936657577453
##int_simpson = 1.851936951982472
##int_reference = 1.851936951982467
##err_trapeze = 2.9441e-07
##err_simpson = 4.6629e-15