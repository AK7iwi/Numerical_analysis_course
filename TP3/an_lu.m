function [L U] = an_lu (A);
  %Factorisation LU de A;
  n = size(A,2); % n = nombre de colonnes de A
  for k = 1 : n ;
    for j = k:n ;
      U(k,j) = A(k,j) ;
    end
    L(k,k) = 1;
    for i = k + 1 : n
      L(i,k) = A(i,k)/ A(k,k);
      for j = k + 1 : n
        A(i,j) = A(i,j) - L(i,k) * A(k,j);
      end
    end
  end
end
