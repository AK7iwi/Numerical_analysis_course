% Facto QR numérique
clear all; clc;

A = [ 1 -100 0 0 ; ...
      1 1 -100  0 ; ...
      0 1 1 -100  ; ...
      -100  0 1 1 ] ;
      
Asv = A;

%Construction de R

%Etape 1 

v1 = A(1 : 4,1);
v1(1) = v1(1) + sign(v1(1)) * norm(v1);
v1 = v1 / norm(v1);

%Appliquons H = I - 2vv' sur A

A(1:4,1:4) = A(1:4,1:4) - v1 * (2 *(v1' * A(1:4,1:4)));

%Etape2

v2 = A(2:4,2);
v2(1) = v2(1) +sign(v2(1)) * norm(v2);
v2 = v2/ norm(v2);
A(2:4,2:4) = A(2:4,2:4) - v2 * (2 *(v2' * A(2:4,2:4)));

%Etape3

v3 = A(3:4,3);
v3(1) = v3(1) + sign(v3(1)) * norm(v3);
v3 = v3 / norm(v3);

A(3:4,3:4) = A(3:4,3:4) - v3 * (2 *(v3' * A(3:4,3:4)));
R = A;

%Calcul de Q

% Q = I

Q = eye(4);

%Q = Q3 *I
Q(3:4,3:4) = Q(3:4,3:4) - v3 * (2 *(v3' * Q(3:4,3:4)));

%Q = Q2 * Q3 * I
Q(2:4,2:4) = Q(2:4,2:4) - v2 * (2 *(v2' * Q(2:4,2:4)));

% Q = Q1 * Q2 * Q3 * I

Q(1:4,1:4) = Q(1:4,1:4) - v1 * (2 *(v1' * Q(1:4,1:4)));

%Verification 

[q,r] = qr(Asv);
norm(Q-q)
norm(R-r)











