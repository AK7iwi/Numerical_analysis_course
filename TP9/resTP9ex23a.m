% TP9 ex2a,3a

clear all; close all; clc;
a = -2  ;
b = 1 ; 
f = @(x) x*exp(x) ;
fpp = @(x)  (x+2).*exp(x) ; 
x = a :0.01 : b ;
plot(x,abs(fpp(x)))
c = 1;
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
##int_trapeze = 4.060060774111644e-01
##int_simpson = 4.060058497098393e-01
##int_reference =   4.060058497098382e-01
##err_trapeze = 0.00000022770
##err_simpson = 1.0547e-15