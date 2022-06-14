% TP 5 ex1,2

clear all; clc;

A = round(inv(hilb(6))) ; 
A = A(:,1:4) ; 
b1 = [11586; -315210; 2067240; -5259240; 5709060; -2220372];
b2 = ones(6,1);

%Résolution des 2 systèmes par PA = LU

AtA = A'*A;
Atb1 = A'*b1 ;  Atb2 = A'*b2;
[L U P] = lu(AtA);
y1 = L\(P*Atb1); y2 = L\(P*Atb2);
x1_PALU = U\y1;
x2_PALU = U\y2;

%Resolution par QR

[Q R] = qr(A,0);
x1_QR = R\(Q' * b1);
x2_QR = R\(Q' * b2);

%Partie b

condA = cond(A);
r1 = b1 - A * x1_QR; r2 = b2 - A * x2_QR;
theta1 = acos(norm(r1 +b1)/norm(b1)); theta2 = acos(norm(r2 +b2)/norm(b2)); 
KMCA1 = condA + condA^2*norm(r1)/(norm(A) * norm(x1_QR))
KMCA2 = condA + condA^2*norm(r2)/(norm(A) * norm(x2_QR))
KMCb1 = condA / cos(theta1)
MMCb2 = condA / cos(theta2)

%Système 1
##KMCA1 = 883611.35480
##KMCb1 = 883611.35473
%On remarque que KMCA = KMCb et tous deux à cond(A)
%Le système 1 admet une solution exacte

%Système 2 

##KMCA2 = 24302235.31428
##KMCb2 = 442077.99778
%On remarque que KMCA = KMCb et tous deux à cond(A)
%Le système 2 n'admet pas de solution exacte


%Partie c

sol = [1 -1 1 -1]'
norm(A*sol-b1) % Valeur 0

%Calcul de l'erreur relative par PA = LU

norm(x1_PALU - sol) / norm(sol)

%Calcul de l'erreur relative par QR

norm(x1_QR - sol) / norm(sol)



