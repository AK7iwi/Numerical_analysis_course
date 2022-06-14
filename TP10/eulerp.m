function y = eulerp(f , y0 , t )
% Y = eulerp (F,Y0 ,T)
% Calcule la solution approch ée Y du probl ème de Cauchy
%
% dY/dt = F(t,Y)
% Y(0) = Y0
%
% aux points T en utilisant la mé thode d' Euler progressive .
%
% arguments :
% F - la fonction de deux variables Y et t;
% t - un scalaire
% Y - la solution en t
% Y0 - condition initiale au point T(1)
% T - le vecteur des points où la solution du probl ème de
% Cauchy doit ê tre approchéeµ

% sortie :
% Y - solution approch ée du probl ème de Cauchy
  y (1) = y0 ;
  for i = 1: length ( t ) -1
    h = t( i +1) -t ( i );
    y ( i +1) = y ( i ) + f (t ( i ) ,y ( i ) ) *h ;
  end
endfunction
