
%Cargamos el directorio donde se encuentran alojados nuestros datos
cd;
folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
%Variable correspondiente al sujeto del que vamos a extraer las
%características (S2 a S17) en total 15 sujetos
s = 1;

data_RQA = struct ([]);
data_RQA_filtered = struct([]);

k = 1;

for n = 1 : 15
    
     %Incrementamos el número de sujeto para cambiar de tabla
     s = s + 1;
    
     folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
     if (s==12)
       s = s + 1;
     end

     subject_string = int2str(s);
     path = strcat('S',subject_string);
     cd(path);
     load ('out.mat');

     %Cargamos la señal que vamos a querer usar
     signal = signal.wrist.EDA;

     %Establecemos el tiempo de la ventana
     time = 8;

     %Dividimos la señal en ventanas
     window = Window(signal, time);
     
     for i = 1 : length(window)-1
        
        GSRsignal = signal(window(i):window(i+1));
        [y,eLag,eDim]=phaseSpaceReconstruction(GSRsignal,'MaxLag',30);
    
        %figure('Position',[100 400 460 360]);
        %plot3(y(:,1),y(:,2),y(:,3),'-','LineWidth',1);
        %title('GSR time-delay embedding - state space plot','FontSize',10,'FontWeight','bold');
        %grid on;
        %set(gca,'CameraPosition',[25.919 27.36 13.854]);
        %xlabel('x(t)','FontSize',10,'FontWeight','bold');
        %ylabel('x(t+\tau)','FontSize',10,'FontWeight','bold');
        %zlabel('x(t+2\tau)','FontSize',10,'FontWeight','bold');
        %set(gca,'LineWidth',2,'FontSize',10,'FontWeight','bold');

        % color recurrence plot
        recurdata = cerecurr_y(y);
        %S. Schinkel, O. Dimigen, and N. Marwan, “Selection of Recurrence
        %Threshold for Signal Detection,” The European Physical J.-Special
        %Topics, vol. 164, no. 1, pp. 45-53, 2008
        e_thr=0.1*mean(mean(recurdata));

        %black-white recurrence plot
        %tdrecurr_y(recurdata,e_thr);
        %EQ3
        recurrpt = tdrecurr_y(recurdata,e_thr);

        %Recurrence quantification analysis
        % rqa_stat - RQA statistics - [recrate DET LMAX ENT LAM TT]
        rqa = recurrqa_y(recurrpt);
        %[rrate,det,lmax,ent,lam,tt]
        rrate=rqa(1);
        det=rqa(2);
        lmax=rqa(3);
        ent=rqa(4);
        lam=rqa(5);
        tt=rqa(6);
      
        %Correlation Dimension to calculate D 2.
        %(Note: it is the measure of chaotic signal complexity in multidimensional 
        % phase space and is the slope of the correlation integral versus 
        % the range of radius of similarity)
        corDim=correlationDimension(GSRsignal,eLag,eDim,'NumPoints',100)/2;
         
        data_RQA(n).rqa(i,1) = rrate;
        data_RQA(n).rqa(i,2) = det;
        data_RQA(n).rqa(i,3) = lmax;
        data_RQA(n).rqa(i,4) = ent;
        data_RQA(n).rqa(i,5) = lam;
        data_RQA(n).rqa(i,6) = tt;
        data_RQA(n).rqa(i,7) = corDim;
        data_RQA(n).rqa(i,8) = label(round((700/4)*window(i)));
        
        if (data_RQA(n).rqa(i,8)==1 || data_RQA(n).rqa(i,8)==2 || data_RQA(n).rqa(i,8)==3 || data_RQA(n).rqa(i,8)==4)
        
            data_RQA_filtered(n).rqa(k,1) = rrate;
            data_RQA_filtered(n).rqa(k,2) = det;
            data_RQA_filtered(n).rqa(k,3) = lmax;
            data_RQA_filtered(n).rqa(k,4) = ent;
            data_RQA_filtered(n).rqa(k,5) = lam;
            data_RQA_filtered(n).rqa(k,6) = tt;
            data_RQA_filtered(n).rqa(k,7) = corDim;
            data_RQA_filtered(n).rqa(k,8) = label(round((700/4)*window(i)));
            
            k = k + 1;
        end
     end
      
end  
