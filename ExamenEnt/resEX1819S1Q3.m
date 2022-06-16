%Examen 18-19 S1 Q3

clear all; close all; clc;

a = 1e-7  ;
b = 2 ; 
f = @(x) (1 - cos(x)) ./ x ;
fpp = @(x) (x.^2 .* cos(x) - 2 * x .*sin(x) + 2 - 2 * cos(x))./ x.^3 ;
x = a : 0.1: b ;
plot(x,abs(fpp(x)))
c = 2;
Majorant = abs(fpp(c)) ;
h = sqrt(3e-4 / (b-a) /  Majorant) ;
n = ceil((b-a)/h) ; %ceil = arrondi supérieur (plafond)
% floor = arrondi inferieur (plancher)
format short
int_trapeze = itg_trp(f,a,b,n)
int_reference = quad(f,a,b) %"fais office de solution exacte"
err_trapeze = abs(int_trapeze - int_reference)



