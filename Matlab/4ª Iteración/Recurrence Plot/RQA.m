
%Cargamos el directorio donde se encuentran alojados nuestros datos
cd;
folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
%Variable correspondiente al sujeto del que vamos a extraer las
%características (S2 a S17) en total 15 sujetos
s = 1;


    
     %Incrementamos el número de sujeto para cambiar de tabla
     s = s + 1;
    
     folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
    

     subject_string = int2str(s);
     path = strcat('S',subject_string);
     cd(path);
     load ('out.mat');

     %Cargamos la señal que vamos a querer usar
     GSRsignal = filtered_signal(signal.wrist.EDA, label);

     %Establecemos el tiempo de la ventana
     time = 8;

     %Dividimos la señal en ventanas
     window = Window(GSRsignal, time);
     
      [y,eLag,eDim]=phaseSpaceReconstruction(GSRsignal,'MaxLag',500);
    
      figure('Position',[100 400 460 360]);
      plot3(y(:,1),y(:,2),y(:,3),'-','LineWidth',1);
      title('GSR time-delay embedding - state space plot','FontSize',10,'FontWeight','bold');
      grid on;
      set(gca,'CameraPosition',[25.919 27.36 13.854]);
      xlabel('x(t)','FontSize',10,'FontWeight','bold');
      ylabel('x(t+\tau)','FontSize',10,'FontWeight','bold');
      zlabel('x(t+2\tau)','FontSize',10,'FontWeight','bold');
      set(gca,'LineWidth',2,'FontSize',10,'FontWeight','bold');

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
    
