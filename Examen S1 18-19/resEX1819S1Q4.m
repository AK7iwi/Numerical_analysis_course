%Examen 18-19 S1 Q4

clear all; close all; clc;


f = @(t,y)  [2 * y(1) - y(1) * y(2) ;y(1) * y(2) - 0.2*y(2)];

y0 = [1;1];

T = 5;
h = 0.001; 
t = 0:h:T;
yp = eulerp(f,y0,t);
yr = eulerr(f,y0,t) ;
figure(1)
plot(t,yp,'g');
hold on;
plot(t,yr,'b');

f2 = @(y,t) [2 * y(1) - y(1) * y(2) ;y(1) * y(2) - 0.2 * y(2)] ;

h1 = 0.1;
t1 = 0:h1:T;
yp1 = eulerp(f,y0,t1);  %1re solution numérique

h2 = 0.05 ;
t2 = 0:h2:T;
yp2 = eulerp(f,y0,t2);  %2eme solution numérique pour un pas 2x plus petit 

h3 = 0.001 ;
t3 = 0:h3:T;
yp3 = eulerp(f,y0,t3);  %solution exacte

err11 = abs(yp1(1,:) - yp3(1,1:100:end));
err21 = abs(yp2(1,:) - yp3(1,1:50:end)); 

figure(2)
plot(t1, err11, 'g');
hold on ;
plot(t2,err21,'b');
norm(err11,'inf') / norm(err21, 'inf') 

err12 = abs(yp1(2,:) - yp3(2,1:100:end));
err22 = abs(yp2(2,:) - yp3(2,1:50:end)); 

figure(3)
plot(t1, err12, 'g');
hold on ;
plot(t2,err22,'b');
norm(err12,'inf') / norm(err22, 'inf') 
