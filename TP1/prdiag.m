%TP 1 ex 3
function y = prdiag(A)
  %On calcule p, le produit des éléments diagnaux de A
  [m , n ] = size (A) ;
  p = 1 ;
  for i = 1: min (m , n )
    p =  p * A (i , i ) ;
end