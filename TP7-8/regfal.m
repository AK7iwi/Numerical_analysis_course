function [x it] = regfal(f ,a ,b , res , maxit )
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
