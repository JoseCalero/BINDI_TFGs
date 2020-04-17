%% FUNCION QUE RECOGE EL ETIQUETADO EN VALENCE-AROUSAL DEL SELF REPORT
%

function [label_out_VA, label_out_estado] = get_label(k, ventanas, VA, baseline, stress, medi1, amusement, medi2)
%% LE DAMOS EL VALOR A LABEL_OUT 
%
%

label_out_VA = 0;
label_out_estado = 0;

if round(baseline(1)*64/700) <= ventanas(k) && round(baseline(end)*64/700) >= ventanas(k)
    label_out_VA = VA(1);
    label_out_estado = 1;
end
    
if round(stress(1)*64/700) <= ventanas(k) && round(stress(end)*64/700) >= ventanas(k)
    label_out_VA = VA(2);
    label_out_estado = 2;
end

if round(medi1(1)*64/700) <= ventanas(k) && round(medi1(end)*64/700) >= ventanas(k)
    label_out_VA = VA(3);
    label_out_estado = 3;
end

if round(amusement(1)*64/700) <= ventanas(k) && round(amusement(end)*64/700) >= ventanas(k)
    label_out_VA = VA(4);
    label_out_estado = 4;
end

if round(medi2(1)*64/700) <= ventanas(k) && round(medi2(end)*64/700) >= ventanas(k)
    label_out_VA = VA(5);    
    label_out_estado = 5;
end

end