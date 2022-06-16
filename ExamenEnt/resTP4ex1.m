% TP 4 ex1
% Résolution numérique des matrices L,U,P
clear all ; clc;

A = [ 1 -100 0 0 ; ...
      1 1 -100  0 ; ...
      0 1 1 -100  ; ...
      -100  0 1 1 ] ;
      
Asv = A ; % sauvegarde de A

%Etape 1
P1 = eye(4); P1([1,4], :) = P1([4,1], :) ; A = P1 * A;
L1 = eye(4); L1([2:4],1) = -A([2:4],1)/A(1,1); A = L1 *A;

%Etape2

P2 = eye(4); P2([2,4], :) = P2([4,2], :) ; A = P2 * A;
L2 = eye(4); L2([3:4],2) = -A([3:4],2)/A(2,2); A = L2 *A;

%Etape3

P3 = eye(4); P3([3,4], :) = P3([4,3], :) ; A = P3 * A;
L3 = eye(4); L3(4,3) = -A(4,3)/A(3,3); U = L3 *A; %Determination de U

%Calcul de P

P = P3 * P2 * P1;

%Calcul de L

Lp1 = P3 * P2 * L1 * P2 * P3;
Lp2 = P3 * L2 * P3;
Lp3 = L3;
L = eye(4);
L(2:4,1) = -Lp1(2:4,1);
L(3:4,2) = -Lp2(3:4,2);
L(4,3) = -Lp3(4,3);

%Verifictation avec l'instruction lu d'octave

[l,u,p] = lu(Asv)
norm(L-l)
norm(U-u)
norm(P-p)
