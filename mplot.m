%

filename = ['G:\ch0618\output\chem_nor_mean_2.mat'];
load(filename);

Part_Mean = mean(mean(MeanImage,1),2);

% Max_Value = zeros(1,9);
% Index_Phase =zeros(1,9);
% [Max_Value(9), Index_Phase(9)] = max(Part_Mean(1,1,:));
% 
% FileName = 'G:/ch0618/PM/chem_index_mean_f.mat'; % output file name
% save(FileName,'Index_Phase');  

%y=zeros(1,33);

% yp(1,1:32)=Part_Mean(1,1,:)-y(2);
% yp(1,33)=Part_Mean(1,1,1)-y(2);


%xticklabels=[0 50 60 70 80 90 100 110 120];
% x=0:pi/16:2*pi;
 scrsz=get(groot,'ScreenSize');
 figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);
plot(y,'-ok')
%plot(x,yp,'- hk')
%plot(x,y,'-', 'color', [1 0.5 0]);
%plot(x,y,'-', 'color', [0.6 0.6 0.5]);
%plot(x,y, 'color', [0.3 0.6 0.7]);
pbaspect([1.62 1 1])
%daspect([4 60 1])
%daspect([1 1250 1])
% yLim = ([150 250])
% xticklabels=({'0', '50', '60', '70', '80', '90', '100', '110', '120'})
%loglog(ff,pxxf,'-r')
 ax = gca;
   %ax.XLim = [0 2*pi];
      %ax.YLim = [190 230];
      ax.XTickMode = 'manual';
      ax.YTickMode = 'manual';
%      %xtickformat('%.1f')
%      ytickformat('%.1f')
     % ax.XTick = 0:pi/4:2*pi;
     ax.XTick = -30:2:34;
      %ax.XTickLabel=({'50', '60', '70', '80', '90', '100', '110', '120'});
   %   ax.XTickLabel=({'0', '1/4\pi', '1/2\pi', '3/4\pi', 'pi', '5/4\pi', '3/2\pi', '7/4\pi', '2\pi'});
   ax.XTickLabel=({'-30', '-10', '0', '10', '30'});
 %    ax.YTick = 190:20:230;
 ax.YTick = 2:10:72;
 ax.YTickLabel=({'10', '30', '50', '70'});
     ax.FontSize = 18;
     ax.FontName =  'Times New Roman';
     ax.TitleFontSizeMultiplier = 2;
%     %xlabel('\it \fontname{Times New Roman}t \rm[sec]');
     ylabel('\it \fontname{Times New Roman}i \rm');
%     %legend('110Hz','Location','NorthEast');

plot(off,'--k')