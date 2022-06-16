function [ x it r ] = newton(f , fp , x0 , res , maxit )
  x = x0 ;
  for it = 1: maxit
    r = norm ( f ( x ) ) ;
    if ( r < res )
      it --;
      return ;
    elseif ( fp ( x ) == 0)
      error ([ 'La méthode a obtenu une dérivable nulle en x = ', num2str ( x ) ]) ;
    end
    x = x - fp ( x ) \ f ( x );
  end
end
