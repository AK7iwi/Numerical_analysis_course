function y = heun(f , y0 ,t )
  y(1) = y0 ;
  for i = 1: length (t) - 1
    h = t(i + 1) - t(i);
    fi = f(t(i),y(i)) ;
    y (i + 1) = y(i) + (fi + f(t(i +1), y(i) + h * fi )) * h /2;
  end
end
