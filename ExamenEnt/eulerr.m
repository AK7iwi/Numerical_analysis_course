function y = eulerr(f , y0 , t )
% Y = eulerp (F,Y0 ,T)
% Calcule la solution approch ée Y du probl ème de Cauchy
%
% dY/dt = f(t,Y)
% Y(0) = Y0
%
% aux points T en utilisant la mé thode d' Euler ré trograde .
% L' instruction peut ê tre utilis ée avec une fonction F
% vectorielle de dimension N; dans ce cas , Y0 est un
%vecteur
% de taille N et le ré sultat Y sera une matrice N x Nt ,
% où Nt est le nombre d 'élé ments dans T.
%
% arguments :
% F - la fonction de deux variables y et t;
% t - un scalaire
% y - un vecteur de même dimension que Y0
% Y0 - condition initiale au point T(1)
% T - le vecteur des points où la solution du probl ème de
% Cauchy doit ê tre approch ée
%
% sortie :
% Y - solution approch ée du probl ème de Cauchy
  y(: ,1) = y0 ;
  for i = 1: length (t) - 1
    h = t(i + 1) - t(i);
    g = @(x) y(: , i ) + f(t(i + 1) ,x ) * h - x ;
    y (: , i + 1) = fsolve(g , y(: , i )) ;
  end
end
