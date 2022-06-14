function tp6pb
   % gÃ©nÃ©rer les donnÃ©es & les reprÃ©senter via plot
x = [1,2,3,4,5,6];
f = rand(length(x),1);
plot(x,f,'*r'); hold on;
   % construire la fonction d'interpolation 
s = spl_interpol(x,f);
   % reprÃ©senter la fonction d'interpolation 
xr = x(1)+[0:0.01:1]*(x(end)-x(1));
for i = 1:length(xr)
    fr(i) = spl_eval(xr(i), x, s);
end
plot(xr,fr)
hold off


function fo = spl_eval(xo,x,s)
% FO = spl_eval(XO,X,S)
%    la fonction renvoie la valeur FO d'un polynÃ´me cubique
%    par morceaux qui est dÃ©finit par les N abscisses 
%    X(1), ..., X(N) et les parametres S(i,:) du polynome
%    entre les deux abscisses X(i) et X(i+1) successives
%    
% arguments:
%    XO- l'abscisse oÃ¹ on veut Ã©valuer le polynÃ´me cubique
%        par morceaux; X0 doit Ãªtre entre X(1) et X(N)
%    X - le vecteur de taille N x 1 qui contient
%        les points d'interpolation; on demande Ã  ce que
%        N > 1 et X(1) < X(2) < ... < X(N)
%    S - S(i,1), S(i,2), S(i,3) et S(i,4), i=1,...,N - 1
%        sont les parametres qui definissent le polynÃ´me 
%        d'interpolation entre les abscisses X(i) et X(i+1)
%
% sortie:
%    FO- valeur d'un polynÃ´me cubique par morceaux 
%        au point XO
%
    n = length(x);
    if (n < 3)
        error(['Le nombre d"Ã©lÃ©ments de X doit Ãªtre > 2']);
    elseif (min(size(x))~=1)
        error(['X doit Ãªtre un vecteur']);        
    elseif (size(s,1)~=n-1)
        error(['La matrice S doit avoir ',int2str(n-1),' lignes']);
    elseif (size(s,2)~=4)
        error(['La matrice S doit avoir 4 colonnes']);
    elseif (xo < x(1) || xo > x(n))
        error(['XO doit Ãªtre entre X(1) et X(N)']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit Ãªtre un vecteur strictement croissant']);
    else
        i = min(max( find(x <= xo) ), n - 1);
        fo = s(i,1)*(x(i+1)-xo)^3 + s(i,2)*(xo-x(i))^3 + ...
             s(i,3)*(xo-x(i)) + s(i,4);
    end
end
    
function s = spl_interpol(x,y)
% S = spl_interpol(X,Y) 
%    la fonction determine le polynÃ´me cubique par morceaux 
%    qui passe par N points (X(1), Y(1)),...,(X(N), Y(N)); 
%    le polynÃ´me entre les deux abscisses X(i) et X(i+1) 
%    est defini via les parametres par S(i,1),..., S(i,4)
%    
% arguments:
%    X - le vecteur de taille N x 1 qui contient
%        les points d'interpolation; on demande Ã  ce que
%        N > 2 et X(1) < X(2) < ... < X(N)
%    Y - le vecteur de taille N x 1 qui contient
%        les valeurs aux points d'interpolation;
%
% sortie:
%    S - S(i,1), S(i,2), S(i,3) et S(i,4), i=1,...,N - 1
%        sont les parametres qui specifient le polynÃ´me
%        d'interpolation entre les abscisses X(i) et X(i+1)
%
    n = length(x);
    if (n < 3)
        error(['Le nombre d"Ã©lÃ©ments de X doit Ãªtre > 2']);
    elseif (min(size(x))~=1 || min(size(y))~=1)
        error(['les arguments doivent Ãªtre des vecteurs']);        
    elseif (length(y) ~= n)
        error(['Les vecteurs X & Y doivent avoir la mÃªme taille']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit Ãªtre un vecteur strictement croissant']);
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
           % dÃ©termination des parametres
        A = 2*diag(ones(n,1)) + diag(mu,-1) + diag(lb,1);
        [u itr rr] = jac_3diag(A,d,1e-3,1000,zeros(length(d),1));
        s(:,1) = u(1:n-1)./h./6;
        s(:,2) = u(2:n)./h./6;
        s(:,3) = (y(2:n)-y(1:n-1))./h-(u(2:n)-u(1:n-1)).*h./6;    
        s(:,4) = y(1:n-1)-u(1:n-1).*h.*h./6;    
    end
 end
       
function [ x iter rr ] = jac_3diag (A ,b , tol , maxit , xo )
% X = jac_3diag (A,B,TOL ,MAXIT ,XO)
% applique la methode de Jacobi à un syst ème
% tridiagonal AX=B avec XO comme approximation initiale
% de la solution ; utilise comme crit ère d' arrêt le résidu
% relatif en norme euclidienne inf é rieur à TOL ou le
% dé passement du nombre maximal MAXIT d'ité rations ; mis à
% part la solution approch ée X la fonction retourne le
% nombre d'ité rations ITER et le ré sidu relatif RR
% correspondant à X.
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
    % ou pour ne tenir compte que des 3 diagonales
    % r = b - diag (A).*x - diag (A ,1) .*x (2: end) ...
    % - diag (A , -1) .*x(1: end -1) ;
    rr = norm ( r ) / norm ( b ) ;
    if ( rr <= tol )
      break
    end
  end
