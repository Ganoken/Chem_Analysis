%Find peaks and make time stamp 
%
%Sujoy created 2018/06

%% initialize and load data
Frequency = 20e3;%kHz sampling freq
%RawPData = csvread('I:/pres/20180618/pressure_19.xlsx'); %%Assuming the data is in csv format maybe use input
RawPData = xlsread('I:/pres/20180618/pressure_11.xlsx','A2:A200001');
DataCount = length(RawPData); % Get the # of Data 
MaxT = DataCount/Frequency; % Get the duration of data
TimeLine = 0:1/Frequency:MaxT-(1/Frequency); % Generate the time vactor for the Data
TimeLine=TimeLine(1:2:40000);
PData = RawPData(1:2:40000); % need two sec try skip 1 and compare the number of peaks


%% Peak Detection
[Peaks,TimeStamps] = findpeaks(PData,TimeLine,'MinPeakDistance',0.0045);
% pos = round(TimeStamps/2)

%
% numArrays = 10;
% BI = cell(numArrays,1);
% for n = 1:numArrays
%     FileName = ['../../LIF/BinarizeImage/20170104L_75_on_1_201701_1147' num2str(n,'%03u') '.mat'];
%     BI{n} = load(FileName);
% end
% 
% PeakImage = zeros(501,501,length(pos));
% 
% for j=1:length(pos)
% 
%     if pos(j) <= 2000
%         PeakImage(:,:,j) = BI{1}.BinarizeImage(:,:,pos(j));
%     elseif pos(j) <= 4000
%         PeakImage(:,:,j) = BI{1}.BinarizeImage(:,:,pos(j)-2001);
% 
%     end
% end

for j=1:length(TimeStamps)