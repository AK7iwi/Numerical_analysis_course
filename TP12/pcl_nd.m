function y = pcl_nd(m , f )
  h = 1/m;
  h2 = h*h ;
  A = (2+h2)*diag(ones(m,1),0) -diag(ones(m-1,1),-1) - diag(ones(m-1,1),1);
  A (1 ,1) /=2 ;
  for k = 1: m
     b (k) = h2 * f(( k -1)/m) ;
  endfor
    b (1) /=2 ;
    b = b';
    y = A\b ;
    y = [ y ; ];
end
