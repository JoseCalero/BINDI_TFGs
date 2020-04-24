%Area debajo de la señal

y = signal.wrist.EDA ;

xmin = 0 ;

xmax = find (y(end)) ;

area = int (y, xmin, xmax) ;
