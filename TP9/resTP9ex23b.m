% TP9 ex2b,3b

clear all; close all; clc;
a = 0  ;
b = 2 ; 
f = @(x) 2/sqrt(pi)*exp(-x^2) ;
fpp = @(x)  4/sqrt(pi)*(2*x.^2-1).*exp(-x.^2); 
x = a :0.01 : b ;
plot(x,abs(fpp(x)))
c = 0;
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
##int_trapeze = 0.995322246715773
##int_simpson = 0.995322265018950
##int_reference =  0.995322265018953
##err_trapeze = 1.8303e-08
##err_simpson = 2.5535e-15