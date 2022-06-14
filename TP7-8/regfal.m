function [ x it ] = regfal (f ,a ,b , res , maxit )
% X = regfal (F,A,B,RES , MAXIT ) fausse position
% d� termine un z�ro de la fonction F(X) d'une
% variable dans l' intervalle [A,B] si
% la condition suivante ( condition de " bracketing ")
% F(A)*F(B) < 0
% est satisfaite ;
% arguments :
% F - la fonction dont on d� termine un z�ro
% A,B - les extr � mit �s de l' intervalle sur lequel
% on cherche un z�ro
% RES - la m� thode s' arr �te si |F(X)| <= RES
% MAXIT - le nombre maximal d '� valuations de F
% sortie :
% X - l' approximation calcul �e du z�ro
% IT - nombre d'it� rations utilis �es
% R - valeur de |F(X)|
  if ( f( a ) * f ( b ) >= 0)
    error ('f(a)*f(b) doit �tre < 0')
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
endfunction