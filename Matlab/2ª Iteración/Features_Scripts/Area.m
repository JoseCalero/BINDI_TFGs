%Area debajo de la se�al

y = signal.wrist.EDA ;

xmin = 0 ;

xmax = find (y(end)) ;

area = int (y, xmin, xmax) ;
