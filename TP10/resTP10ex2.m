%TP10 ex2

clear all; close all; clc;
f = @(t,v) 9.0 -0.1*v*abs(v);
v0 = 0;
T = 5;
h = 0.1;
t = 0:h:10;
vp = eulerp(f,v0,t) ;
vheun = heun(f,v0,t);
figure(1)
plot(t,vp,'g');
hold on;
plot(t,vheun,'b');