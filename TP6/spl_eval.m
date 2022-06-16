function fo = spl_eval(xo,x,s)
    n = length(x);
    if (n < 3)
        error(['Le nombre d elments de X doit être > 2']);
    elseif (min(size(x))~=1)
        error(['X doit être un vecteur']);        
    elseif (size(s,1)~=n-1)
        error(['La matrice S doit avoir ',int2str(n-1),' lignes']);
    elseif (size(s,2)~=4)
        error(['La matrice S doit avoir 4 colonnes']);
    elseif (xo < x(1) || xo > x(n))
        error(['XO doit être entre X(1) et X(N)']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit être un vecteur strictement croissant']);
    else
        i = min(max( find(x <= xo) ), n - 1);
        fo = s(i,1)*(x(i+1)-xo)^3 + s(i,2)*(xo-x(i))^3 + ...
             s(i,3)*(xo-x(i)) + s(i,4);
    end
end
    
