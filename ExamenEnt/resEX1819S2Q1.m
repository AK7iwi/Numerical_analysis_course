%Examen 18-19 S2 Q1

%Résolution numérique des matrices L,U,P

clear all; close all; clc;

A = [2 6 5 1 7 ; 6 9 2 2 3 ; 7 9 0 6 5 ; 1 1 6 6 7 ; 2 7 7 3 9];

Asv = A;

%Etape 1 

P1 = eye(5); P1([1;3],:) = P1([3;1],:) ; A = P1 * A;
L1 = eye(5); L1([2:5], 1) = -A([2:5],1)/A(1,1); A = L1 *A;

%Etape 2

P2 = eye(5); P2([2;5], :) = P2([5;2], :) ; A = P2 * A;
L2 = eye(5); L2([3:5], 2) = -A([3:5],2)/A(2,2); A = L2 *A;

%Etape 3

P3 = eye(5); P3([3;4],:) = P3([4;3],:); A = P3 * A;
L3 = eye(5); L3([4:5], 3) = -A([4:5],3)/A(3,3); A = L3 *A;

%Etape 4

P4 = eye(5); P4([4;5], :) = P4([5;4], :) ; A = P4 * A;
L4 = eye(5); L4(5,4) = -A(5,4)/A(4,4); U = L4 *A

%Calcul de P

P = P4 * P3 * P2 * P1

%Calcul de L

Lp1 = P4 * P3 * P2 * L1 * P2 * P3 * P4;
Lp2 = P4 * P3 * L2 * P3 * P4;
Lp3 = P4 * L3 * P4;
Lp4 = L4;
L = eye(5);
L(2:5,1) = -Lp1(2:5,1);
L(3:5,2) = -Lp2(3:5,2);
L(4:5,3) = -Lp3(4:5,3);
L(5,4) = -Lp4(5,4)

%Verifictation avec l'instruction lu d'octave

[l,u,p] = lu(Asv);
norm(L-l)
norm(U-u)
norm(P-p)

d2 = U(1,1);
for i=2:5
  d2 *= U(i,i)
endfor




