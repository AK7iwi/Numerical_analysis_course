%Examen 18-19 S1 Q1
clear all; close all; clc;

A = [2 6 5 1 7; 6 9 2 2 3 ; 7 9 0 6 5; 1 1 6 6 7 ; 2 7 7 3 9]
b = [1 ; 2 ; 3 ; 4 ; 5]

Asv = A;

%Construction de R

%Etape 1

v1 = A(1 : 5 , 1);
v1(1) = v1(1) + sign(v1(1)) *norm(v1);
v1 = v1 /norm(v1) ;

%Appliquons H = I - 2vv' sur A

A(1:5,1:5) = A(1:5,1:5) - v1 * (2 *(v1' * A(1:5,1:5))) ;

%Etape2

v2 = A(2 : 5 , 2);
v2(1) = v2(1) + sign(v2(1)) *norm(v2);
v2 = v2 /norm(v2) ;
A(2:5,2:5) = A(2:5,2:5) - v2 * (2 *(v2' * A(2:5,2:5))) ;

%Etape3 

v3 = A(3 : 5 , 3);
v3(1) = v3(1) + sign(v3(1)) *norm(v3);
v3 = v3 /norm(v3) ;
A(3:5,3:5) = A(3:5,3:5) - v3 * (2 *(v3' * A(3:5,3:5)));

%Etape4

v4 = A(4 : 5 , 4);
v4(1) = v4(1) + sign(v4(1)) *norm(v4);
v4 = v4/norm(v4) ;
A(4:5,4:5) = A(4:5,4:5) - v4 * (2 *(v4' * A(4:5,4:5)));
R = A;

%Calcul de Q

%Q = I

Q = eye(5);

%Q = Q4 * I

Q(4:5,4:5) = Q(4:5,4:5) - v4 * (2 *(v4' * Q(4:5,4:5)));

%Q = Q3 * Q4 * I

Q(3:5,3:5) = Q(3:5,3:5) - v3 * (2 *(v3' * Q(3:5,3:5)));

%Q = Q2 * Q3 * Q4 * I

Q(2:5,2:5) = Q(2:5,2:5) - v2 * (2 *(v2' * Q(2:5,2:5))) ;

%Q = Q1 * Q2 * Q3 * Q4 * I

Q(1:5,1:5) = Q(1:5,1:5) - v1 * (2 *(v1' * Q(1:5,1:5))) ;

%Verification 

[q r] = qr(Asv);
norm(Q-q)
norm(R-r)


y = R\(Q'*b);
x = R\(Q'*y)

x = R\(Q'*(R\eye(5,5))*Q'*b)













