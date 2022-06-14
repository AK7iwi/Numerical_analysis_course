function [x it r ] = newton_rl (f , fp , x0 , res , maxit )
% X = newton_rl (F,FP ,X0 ,RES , MAXIT )
% d� termine un z�ro de la fonction F(X) d'une ou de
% plusieurs variables avec X0 comme point de d� part
% arguments :
% F - la fonction dont on d� termine un z�ro
% FP - la d�riv�e de F
% X0 - approximation initiale du z�ro
% RES - la m� thode s' arr �te si |F(X)| < RES
% MAXIT - le nombre maximal d'it� rations
% sortie :
% X - l' approximation calcul �e du z�ro
% IT - nombre d'it� rations utilis �es
% R - valeur de |F(X)|
  x = x0 ;
  for it =1: maxit
    r = norm ( f ( x ) ) ;
    if ( r < res )
      it --;
      return ;
    elseif ( fp ( x ) == 0)
      error ([ 'La m� thode a obtenu une d�riv�e nulle en x =', num2str ( x ) ]) ;
    end
    d = fp ( x ) \ f ( x ) ;
    a = 1;
    while ( true )
      xn = x - d * a;
      if ( norm ( f ( xn ) ) < r )
        x = xn ;
        break
      end
      a = a /2;
    end
  end
endfunction