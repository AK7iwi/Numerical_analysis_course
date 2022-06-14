%TP 7 ex2

clear all; close all; clc;

##ezplot (@(x,y)  x.^2 - y -1)
##hold on
##axis equal
##ezplot (@(x,y) (x-2).^2 + (y-0.5).^2 -1)
%2 solutions approximativment en (1.1 ; 0.15) et (1.55 ; 1.4)

%Il faut faire mesh car demandé dans l'énoncé
F = @(x) [ x(1).^2 - x(2)-1 ; (x(1)-2).^2+(x(2)-0.5).^2-1]
Fp = @(x) [2*x(1)   -1 ; 2*x(1)-4   2*x(2)-1]

nFlimite = @(x) min(norm(F(x)),0.5);
X = 0:0.1:2;
Y = 0:0.1:2;
for i = 1:length(X)
  for j = 1:length(Y)
    Z(i,j) = nFlimite([X(i) ; Y(j)]) ;
  endfor
endfor
mesh(X,Y,Z')
xlabel('x'); ylabel('y'); zlabel('z');
%2 solutions approximativement en [1.1 ; 0.2] et [1.6 ; 1.4]

x0 = [1.1 ; 0.2]
[x_newton it_newton r_newton] = newton(F,Fp,x0,1e-12,100)
[x_newton_rl it_newton_rl r_newton_rl] = newton_rl(F,Fp,x0,1e-12,100)

x0 = [1.6 ; 1.4]
[x_newton it_newton r_newton] = newton(F,Fp,x0,1e-12,100)
[x_newton_rl it_newton_rl r_newton_rl] = newton_rl(F,Fp,x0,1e-12,100)