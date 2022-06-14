%TP 2 ex 4a
function err = aprxerr(h)
  % renvoie err( l'erreurs entre f'h(1) et f'(1) si h est donné
  fh = ((1+h)^2 - 1) / h;
  fp = 2;
  err = abs(fh - fp);
end
