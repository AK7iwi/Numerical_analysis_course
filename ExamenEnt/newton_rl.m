function [x it r] = newton_rl(f , fp , x0 , res , maxit )
  x = x0 ;
  for it =1: maxit
    r = norm ( f ( x ) ) ;
    if ( r < res )
      it --;
      return ;
    elseif ( fp ( x ) == 0)
      error ([ 'La methode a obtenu une dérivable nulle en x =', num2str ( x ) ]) ;
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
end
