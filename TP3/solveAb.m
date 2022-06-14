function x = solveAb(A,b)
  [L U] = an_lu(A)
  y = L\b;
  x = U\y;
end
