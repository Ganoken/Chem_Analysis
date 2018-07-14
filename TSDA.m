% To analyse spatial average chem data
% Sujoy 07/2018

%% load data

filename = ['I:\ch0618\output\chem_smean.mat'];
load(filename);


%numArrays = 9;
% TSD = cell(numArrays,1);
% for n = 1:numArrays
%     FileName = ['I:/ch0618/PM/chem_' num2str(FileIndex(n)) '_mean_3.mat']; % need to change 
%     BI{n} = load(FileName);
% end


%% filter/smoth

Fs = 10e3;
windowSize = 10; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;

for j=1:9
    filtered_CD(j,:) = filtfilt(b,a,MeanVelocity(j,:));
end
DataCount = length(filtered_CD(1,:));
MaxT = DataCount/Fs;
TimeLine = 0:1/Fs:MaxT-(1/Fs);
TimeLineS =TimeLine(1:2000);

%% PS
nfft = 8192;
[pxxf, ff] = pwelch(filtered_CD(1,:),kaiser(nfft,0.5),[],nfft,Fs,'power');



%%

 scrsz=get(groot,'ScreenSize');
 figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);
%plot(TimeLine,filtered_CD(8,1:20000),'-b');
%plot(TimeLine,filtered_VD,'-', 'color', [1 0.5 0]);
plot(TimeLine,filtered_CD(3,:),'-', 'color', [0.6 0.6 0.5]);
%plot(TimeLine,filtered_VD,'-', 'color', [0.3 0.6 0.7]);
daspect([1 250 1])
%daspect([1 1250 1])
%loglog(ff,pxxf,'-r')
ax = gca;
  %  ax.XLim = [30 300];
    ax.YLim = [100 400];
     ax.XTickMode = 'manual';
     ax.YTickMode = 'manual';
     xtickformat('%.1f')
     ytickformat('%.1f')
     ax.XTick = 0:0.5:2;
     ax.YTick = 100:50:400;
    ax.FontSize = 24;
    ax.FontName =  'Times New Roman';
    ax.TitleFontSizeMultiplier = 2;
    xlabel('\it \fontname{Times New Roman}t \rm[sec]');
    ylabel('\it \fontname{Times New Roman}Intensity \rm');
    legend('110Hz','Location','NorthEast');