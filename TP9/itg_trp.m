function int = itg_trp(f ,a ,b , ni )
    h = (b - a ) / ni ;
    int = 0;
    for i = 1: ni
      int = int + ( h /2) * ( f ( a +( i -1) * h ) + f ( a+ i * h ) ) ;
    end
end
