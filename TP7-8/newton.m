function [ x it r ] = newton (f , fp , x0 , res , maxit )
% X = newton (F,FP ,X0 ,RES , MAXIT )
% dé termine un zéro de la fonction F(X) d'une ou de
% plusieurs variables avec X0 comme point de dé part
% arguments :
% F - la fonction dont on dé termine un zéro
% FP - la dérivée de F
% X0 - approximation initiale du zéro
% RES - la mé thode s' arr ête si |F(X)| < RES
% MAXIT - le nombre maximal d'ité rations
% sortie :
% X - l' approximation calcul ée du zéro
% IT - nombre d'ité rations utilis ées
% R - valeur de |F(X)|

  x = x0 ;
  for it = 1: maxit
    r = norm ( f ( x ) ) ;
    if ( r < res )
      it --;
      return ;
    elseif ( fp ( x ) == 0)
      error ([ 'La mé thode a obtenu une dérivée nulle en x = ', num2str ( x ) ]) ;
    end
    x = x - fp ( x ) \ f ( x );
  end
end
