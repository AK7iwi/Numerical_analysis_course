function y = pcl_nd(m , f )
% Y = pcl_nd (F,NP)
% Calcule la solution approch �e Y du probl �me aux limites
%
% -d^2Y/( dx)^2 + Y = F
% dY/dx (0) = 0 , Y (1) = 0
1
%
% aux NP (NP >1) points � quidistants de l' intervalle [0 ,1].
%
% arguments :
% F - la fonction d' une variable qui d� termine le membre
% de droite de l '� quation
% NP - nombre de points o� la solution est calcul �e
%
% sortie :
% Y - solution approch �e du probl �me aux limites
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
endfunction