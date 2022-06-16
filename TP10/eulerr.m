function y = eulerr(f , y0 , t )
  y(1) = y0 ;
  for i = 1: length ( t ) - 1
    h = t(i + 1) -t(i);
    g = @(x) y(i) + f(t(i + 1), x ) * h - x ;
    y (i + 1) = fsolve(g, y(i));
  end
end
