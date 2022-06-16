function tp6pb
x = [1,2,3,4,5,6];
f = rand(length(x),1);
plot(x,f,'*r'); hold on; 
s = spl_interpol(x,f);
xr = x(1)+[0:0.01:1]*(x(end)-x(1));
for i = 1:length(xr)
    fr(i) = spl_eval(xr(i), x, s);
end
plot(xr,fr)
hold off


function fo = spl_eval(xo,x,s)
    n = length(x);
    if (n < 3)
        error(['Le nombre d elements de X doit être > 2']);
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
    
function s = spl_interpol(x,y)
    n = length(x);
    if (n < 3)
        error(['Le nombre d elements de X doit être > 2']);
    elseif (min(size(x))~=1 || min(size(y))~=1)
        error(['les arguments doivent ÃƒÂªtre des vecteurs']);        
    elseif (length(y) ~= n)
        error(['Les vecteurs X & Y doivent avoir la même taille']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit être un vecteur strictement croissant']);
    else 
        % on manipule vecteurs-colonnes
        if(size(x,2)~=1) x = x'; end;
        if(size(y,2)~=1) y = y'; end;
           % h(i) vaut x(i+1)-x(i) 
        h = x(2:n) - x(1:n-1);
           % mu, lb
        hm = h(1:n-2);
        hp = h(2:n-1);
        mu = hm./(hm + hp); mu(n-1) = 1/2;
        lb(2:n-1) = hp./(hm + hp); lb(1) = 1/2; 
        d(2:n-1) = 6./(hm + hp).* ...
            ((y(3:end)-y(2:end-1))./hp-(y(2:end-1)-y(1:end-2))./hm);
        d(1) = d(2)/2; d(n) = d(n-1)/2;
        d = d';
           % détermination des parametres
        A = 2*diag(ones(n,1)) + diag(mu,-1) + diag(lb,1);
        [u itr rr] = jac_3diag(A,d,1e-3,1000,zeros(length(d),1));
        s(:,1) = u(1:n-1)./h./6;
        s(:,2) = u(2:n)./h./6;
        s(:,3) = (y(2:n)-y(1:n-1))./h-(u(2:n)-u(1:n-1)).*h./6;    
        s(:,4) = y(1:n-1)-u(1:n-1).*h.*h./6;    
    end
 end
       
function [ x iter rr ] = jac_3diag (A ,b , tol , maxit , xo )
  n = length ( b ) ;
  x = zeros (n ,1) ; % pour donner la forme d'un vecteur colonne
  for iter = 1: maxit
    % calcul de x
    x (1) = ( b (1) - A (1 ,2) * xo (2) ) / A (1 ,1) ;
    for i = 2: n -1
      x( i ) = ( b ( i ) -A (i , i +1) * xo ( i +1) -A (i ,i -1) * xo (i -1) )/ A (i , i ) ;
    end
    x ( n ) = ( b ( n ) - A (n ,n -1) * xo (n -1) ) / A (n , n ) ;
    xo = x ;
    % calcul du residu
    r = b - A * x ;
    rr = norm ( r ) / norm ( b ) ;
    if ( rr <= tol )
      break
    end
  end
