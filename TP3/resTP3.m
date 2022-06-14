%TP 3 ex 1,2,3

clear all, clc,

%Données

A1 = ones(5,5) + 4 * eye(5) ; 
b1 = 9 * ones(5,1);
A2 = eye(5) + diag(ones(4,1), - 1) - 1000 * diag(ones(4,1),1) ;
b2 = [999 ; 998 ; 998; 998; -2];
A3 = A2; A3(5,1) = -1000 ;
b3 = b2 ; b3(5,1) = 998 ;

x1_exact = ones(5,1) ; 
x2_exact = -ones(5,1);
x3_exact = -ones(5,1);

%Résolution de Ax = b par LU

x1_LU = solveAb(A1,b1)
x2_LU = solveAb(A2,b2)
x3_LU = solveAb(A3,b3)

%Conditionnement des systèmes et stabilité

u = eps/2;
err1 = norm(x1_LU - x1_exact) / norm(x1_exact);
err2 = norm(x2_LU - x2_exact) / norm(x2_exact);
err3 = norm(x3_LU - x3_exact) / norm(x3_exact);
C1 = err1 / u / cond(A1)
C2 = err2 / u / cond(A2)
C3 = err3 / u / cond(A3)

%C1 = 0.56218  OK
%C2 = 0.00033425 OK
%C3 = 111061.93132 KO Résolution de ce système par LU n'est pa stable

% Reésolution du troisième système par PA = LU
[L U P] = lu(A3);
bp = P*b3 ;
y = L\ bp ;
x3_PALU = U \ y
norm(x3_PALU - x3_exact) / norm(x3_exact) % 0 