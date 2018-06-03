% 20180529 Sujoy
% just to obtain a mean image
% now only do one file at a time, want to make it do all the files at one run
% require loaddat.m to run

%Initialize
close all; clear MeanImage;


%Set parameters
X_Pixels = 768;
Y_Pixels = 768;
Number_Image = 20000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
BatchSize = 100; % # of image to process @one time determine based on memory size
N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
BatchCount = Number_Image/BatchSize; % number of division per file
Number_File = 1; % # of file to analyze
cut_Y = 100:650;
cut_X = 50:500;

%prepare output matrix
Part_MeanImage = zeros(size(cut_Y,2),size(cut_X,2),BatchCount); % change based on the cut
MeanImage = zeros(size(cut_Y,2),size(cut_X,2),Number_File);

% input file
file = 'I:/chem_analysis/chem_%02u_cor.dat'; 

for n=1:Number_File  %temp make another loop with 
    filename = sprintf(file,n+2);
%main loop consider to use function hundle and clear the memory
    for j = 1:BatchCount

        Image = reshape(loaddat(filename,(j-1)*BatchSize*Pixels*2,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]); %load the image
        RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]); %permute
        %CutImage = RawImage (cut_Y(1,:),cut_X(1,:),:); % cut the image if needed better combine with upper line
        Part_MeanImage(:,:,j) = mean(RawImage,3); %obtain a partial mean image

    end
    MeanImage(:,:,n) = mean(Part_MeanImage,3); 

end
%finish up
FileName = ['I:\chem_analysis\mean\chem_mean_t.mat']; % output file name
save(FileName,'MeanImage'); 

%normalization
[Max_Value, I] = max(max(max(MeanImage,[],3))); % find the index
Nor_mean = MeanImage/Max_Value; 
FileName = ['I:\chem_analysis\mean\chem_nor_mean.mat']; % output file name
save(FileName,'Nor_mean'); 


