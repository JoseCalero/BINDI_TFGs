function range = Signal_feat_range(Signal)

min = Signal(1) ;

max = Signal(1) ;

for n=1: length(Signal)
    if (Signal(n) < min)
        min = Signal(n) ;
    end
end

for n=1: length(Signal)
    if (Signal(n) > max)
        max = Signal(n) ;
    end
end

range = max - min ;

end

