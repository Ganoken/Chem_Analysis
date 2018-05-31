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
Number_File = 9; % # of file to analyze
%cut = 

%prepare output matrix
Part_MeanImage = zeros(551,451,BatchCount); % change based on the cut
MeanImage = zeros(551,451,Number_File);

% input file
file='../../chem_03_cor.dat'; 
n=1; %temp make another loop with 

%main loop consider to use function hundle 
for j = 1:BatchCount
    
    Image = reshape(loaddat(file,(j-1)*BatchSize*Pixels*2,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]); %load the image
    RawImage = permute(Image,[2 1 3]); %permute
    CutImage = RawImage (100:650,50:500,:); % cut the image if needed
    Part_MeanImage(:,:,j) = mean(CutImage,3); %obtain a partial mean image

end

%finish up

MeanImage(:,:,n) = mean(Part_MeanImage,3); 
FileName = ['chem_mean.mat']; % output file name
save(FileName,'MeanImage'); 

