function int = itg_smp(f ,a ,b , ni )
    h = (b - a ) / ni ;
    int = 0;
    for i = 1: ni
      int = int + ( h /6) *( f( a +( i -1) * h ) + 4* f ( a +(i -1/2) * h ) + f ( a + i * h ) ) ;
    end
end
