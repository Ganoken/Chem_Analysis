%Save serieas of meanimages according to there pahse
%Sujoy 2018/06

%Set parameters
X_Pixels = 768;
Y_Pixels = 768;
%Number_Image = 20000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
%BatchSize = 200; % # of image to process @one time determine based on memory size
%N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
%BatchCount = Number_Image/BatchSize; % number of division per file
%Number_File = 9; % # of file to analyze
cut_Y = 100:600;
cut_X = 100:600;
file = 'I:/ch0618/ch_17_cor.dat';
 
Phase = zeros ((length(TimeUse)-1),2,PhaseDivision); %contains the position and # of images for certain phase 
ImageTimeVector = 0:1/10000:2-(1/10000); %Time vector for camera image used as the position
s=1;
pos = 1;
x = ImageTimeVector(pos:end) < PhaseTimeStamps (s);
pos = pos+nnz(x);
 %Psition of image


%s=1;
for k=1:(length(TimeUse)-1)
    
    for j=1:PhaseDivision
        x = ImageTimeVector(pos:end) < PhaseTimeStamps (s+1);
        Phase(k,1,j) = pos;
        Phase(k,2,j) = nnz (x);
        pos = pos+nnz(x);
        if pos >= length(ImageTimeVector)
            break
        end
        s = s+1;
    end
    
end

%% method for .mat file
% numArrays = 10;
% BI = cell(numArrays,1);
% for n = 1:numArrays
%     FileName = ['I:/ch0618/mat/chem_off' num2str(n,'%03u') '.mat'];
%     BI{n} = load(FileName);
% end
% 
% MeanImage = zeros(501,501,PhaseDivision);
% PhaseImage = zeros(501,501,700); %700 is an arbitary number
% for j=1:PhaseDivision
%     %k=1;
%     m=1;
%     for k=1:(length(TimeUse)-1)
%         if Phase(k,1,j) == 0
%             break
%         end
%         for l=1:Phase(k,2,j)
%             if (Phase(k,1,j)+l-1) <= 2000
%                     PhaseImage(:,:,m) = BI{1}.RawImage(:,:,Phase(k,1,j)+l-1);
%             elseif (Phase(k,1,j)+l-1) <= 4000
%                     PhaseImage(:,:,m) = BI{2}.RawImage(:,:,Phase(k,1,j)+l-2001);
%             elseif (Phase(k,1,j)+l-1) <= 6000
%                    PhaseImage(:,:,m) = BI{3}.RawImage(:,:,Phase(k,1,j)+l-4001);
%             elseif (Phase(k,1,j)+l-1) <= 8000
%                     PhaseImage(:,:,m) = BI{4}.RawImage(:,:,Phase(k,1,j)+l-6001);
%             elseif (Phase(k,1,j)+l-1) <= 10000
%                     PhaseImage(:,:,m) = BI{5}.RawImage(:,:,Phase(k,1,j)+l-8001);
%             elseif (Phase(k,1,j)+l-1) <= 12000
%                     PhaseImage(:,:,m) = BI{6}.RawImage(:,:,Phase(k,1,j)+l-10001);
%             elseif (Phase(k,1,j)+l-1) <= 14000
%                     PhaseImage(:,:,m) = BI{7}.RawImage(:,:,Phase(k,1,j)+l-12001);
%             elseif (Phase(k,1,j)+l-1) <= 16000
%                     PhaseImage(:,:,m) = BI{8}.RawImage(:,:,Phase(k,1,j)+l-14001);
%             elseif (Phase(k,1,j)+l-1) <= 18000
%                     PhaseImage(:,:,m) = BI{9}.RawImage(:,:,Phase(k,1,j)+l-16001);
%             else
%                     PhaseImage(:,:,m) = BI{10}.RawImage(:,:,Phase(k,1,j)+l-18001);
%             end
%             
%             m=m+1;
%         end
%     %k=k+1;
%     
%     end
%     %SumImage = sum(PhaseImage,3);
%     MeanImage(:,:,j) = mean(PhaseImage,3);
%     %MeanImage(:,:,j) = SumImage/length
% end
% 
% FileName = ''; % output file name
% save(FileName,'MeanImage');  



%% directly use .dat
MeanImage = zeros(501,501,PhaseDivision);
Part_PhaseImage = zeros(501,501,5);
PhaseImage = zeros(501,501,370); %700 is an arbitary number

for j=1:PhaseDivision
        m=1;
    for k=1:(length(TimeUse)-1)
        if Phase(k,1,j) == 0
            break
        end
        Image = reshape(loaddat(file,(Phase(k,1,j)-1)*Pixels*2,Pixels*Phase(k,2,j)),[Y_Pixels,X_Pixels,Phase(k,2,j)]); %load the image
        Part_PhaseImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]); %permute
        PhaseImage(:,:,m)  = mean(Part_PhaseImage,3);
        m=m+1;
    end
    MeanImage (:,:,j) = mean(PhaseImage,3);
   %Max_Image(1,j) = max(max(MeanImage(:,:,j)));
end

FileName = 'I:/ch0618/PM/chem_60_mean_2.mat'; % output file name
save(FileName,'MeanImage');  