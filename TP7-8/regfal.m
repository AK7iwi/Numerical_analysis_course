function [x it] = regfal(f ,a ,b , res , maxit )
% X = regfal (F,A,B,RES , MAXIT ) fausse position
% dé termine un zéro de la fonction F(X) d'une
% variable dans l' intervalle [A,B] si
% la condition suivante ( condition de " bracketing ")
% F(A)*F(B) < 0
% est satisfaite ;
% arguments :
% F - la fonction dont on dé termine un zéro
% A,B - les extr é mit és de l' intervalle sur lequel
% on cherche un zéro
% RES - la mé thode s' arr ête si |F(X)| <= RES
% MAXIT - le nombre maximal d 'é valuations de F
% sortie :
% X - l' approximation calcul ée du zéro
% IT - nombre d'ité rations utilis ées
% R - valeur de |F(X)|
  if ( f( a ) * f ( b ) >= 0)
    error ('f(a)*f(b) doit être < 0')
  else
    for it =1: maxit
      x = a - (b - a ) *f ( a ) /( f ( b ) -f ( a ) ) ;
      if ( f( x ) * f ( a ) < 0)
        b = x;
      elseif ( f( x ) * f ( b ) < 0)
        a = x;
      end
      if ( abs ( f ( x ) ) < res )
        return ;
      end
    end
  end
end
