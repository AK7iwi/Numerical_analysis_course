function y = eulerp(f , y0 , t )
  y(: ,1) = y0 ;
  for i = 1: length (t) - 1
    h = t(i + 1) - t(i);
    y (:, i + 1) = y(: , i ) + f(t(i) ,y(: , i)) * h ;
  end
end
