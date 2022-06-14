function int = itg_smp(f ,a ,b , ni )
% INT = itg_smp (F,A,B,NI)
% retourne l'int� grale num � rique INT sur l' intervalle
% [A,B] de la fonction F d' une variable scalaire .
% La fonction utilise la formule de Simpson
% avec NI sous - intervalles de m�me taille ;
%
% arguments :
% F - la fonction d'une variable � int � grer
% A, B - les extr �mit�s de l' intervalle d'int� gration
% NI - nombre de sous - intervalles ; doit � tre > 0
%
% sortie :
% INT - approximation de l'int� grale de F sur [A,B]
  if ( ni <= 0)
    error ('NI doit � tre > 0') ;
  else
    h = (b - a ) / ni ;
    int = 0;
    for i = 1: ni
      int = int + ( h /6) *( f( a +( i -1) * h ) + 4* f ( a +(i -1/2) * h ) + f ( a + i * h ) ) ;
    end
  end
endfunction