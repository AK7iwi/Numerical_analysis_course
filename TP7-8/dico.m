function [x it ] = dico(f ,a ,b , tol )
% X = dico (F,A,B,TOL)
% dé termine un zéro de la fonction F(X) d'une
% variable dans l' intervalle [A,B] si
% la condition suivante ( condition de " bracketing ")
% F(A)*F(B) < 0
% est satisfaite ;
% arguments :
% F - la fonction dont on dé termine un zéro
% A,B - les extr é mit és de l' intervalle sur lequel
% on cherche un zéro
% TOL - la pré cision absolue avec laquelle on
% dé termine un zéro
% sortie :
% X - l' approximation calcul ée du zéro
% IT - nombre d'ité rations utilis ées
  if ( f( a ) * f ( b ) >= 0)
    error ('f(a)*f(b) doit ê tre < 0')
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