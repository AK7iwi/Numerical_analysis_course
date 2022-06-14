%TP9 ex1

clear all; close all; clc;
n = 10;
a = 0 ;
b = 1;

% Verification de trapeze
f = @(x) 2*x;
int = itg_trp(f,a,b,n) 

% Verification de simpson
f = @(x) x^3;
int = itg_smp(f,a,b,n)