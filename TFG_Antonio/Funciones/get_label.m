%% FUNCION QUE RECOGE EL ETIQUETADO EN VALENCE-AROUSAL DEL SELF REPORT
%

function label_out = get_label(k, ventanas, VA, baseline, stress, medi1, amusement, medi2)
%% LE DAMOS EL VALOR A LABEL_OUT 
%
%

label_out = 0;

if baseline(1)*64/700 <= ventanas(k) && baseline(end)*64/700 >= ventanas(k)
    label_out = VA(1);
end
    
if stress(1)*64/700 <= ventanas(k) && stress(end)*64/700 >= ventanas(k)
    label_out = VA(2);
end

if medi1(1)*64/700 <= ventanas(k) && medi1(end)*64/700 >= ventanas(k)
    label_out = VA(3);
end

if amusement(1)*64/700 <= ventanas(k) && amusement(end)*64/700 >= ventanas(k)
    label_out = VA(4);
end

if medi2(1)*64/700 <= ventanas(k) && medi2(end)*64/700 >= ventanas(k)
    label_out = VA(5);    
end

end