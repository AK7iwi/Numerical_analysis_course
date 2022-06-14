%TP12

clear all; close all; clc;

yexacte = @(x) (sin(pi*(x+1)/2)).^2;
f = @(x) -pi^2/2*cos(pi*(x+1)) + (sin(pi*(x+1)/2)).^2;

% m = 4
m = 4; h = 1/m;
y4 = pcl_nd(m,f);
x4 = 0:h:1; %Vecteur des abcisses pour m= 4
err4 = abs(y4 - yexacte(x4));

% m = 8
m = 8; h = 1/m;
y8 = pcl_nd(m,f);
x8 = 0:h:1; %Vecteur des abcisses pour m= 8
err8 = abs(y8 - yexacte(x8));

% m = 16
m = 16; h = 1/m;
y16 = pcl_nd(m,f);
x16 = 0:h:1; %Vecteur des abcisses pour m= 16
err16 = abs(y16 - yexacte(x16));

plot(x4,err4)
hold on;
plot(x8,err8)
plot(x16, err16)