function [x it] = dico(f ,a ,b , tol )
  if ( f( a ) * f ( b ) >= 0)
    error ('f(a)*f(b) doit être < 0')
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
end
