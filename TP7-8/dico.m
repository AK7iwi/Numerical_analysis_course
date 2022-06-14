function [x it ] = dico(f ,a ,b , tol )
% X = dico (F,A,B,TOL)
% d� termine un z�ro de la fonction F(X) d'une
% variable dans l' intervalle [A,B] si
% la condition suivante ( condition de " bracketing ")
% F(A)*F(B) < 0
% est satisfaite ;
% arguments :
% F - la fonction dont on d� termine un z�ro
% A,B - les extr � mit �s de l' intervalle sur lequel
% on cherche un z�ro
% TOL - la pr� cision absolue avec laquelle on
% d� termine un z�ro
% sortie :
% X - l' approximation calcul �e du z�ro
% IT - nombre d'it� rations utilis �es
  if ( f( a ) * f ( b ) >= 0)
    error ('f(a)*f(b) doit � tre < 0')
  else
    it = 0;
    while ( abs (a - b ) > tol )
      x = (a + b ) /2;
      it = it +1;
      if ( f( x ) * f ( a ) < 0)
        b = x;
      elseif ( f (x ) * f ( b ) < 0)
        a = x;
      else
        return ;
      end
    end
  end
endfunction