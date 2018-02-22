function extractNiftiData
d = dir('/Users/ateghipc/Desktop/spt/coActivationAnalysis/*.nii');
load totalMat.mat

for randi = 1:4763
    disp(['On iter ' num2str(randi)]);
    
    file = d(randi).name;
    path = '/Users/ateghipc/Desktop/spt/coActivationAnalysis';
    fullFile = [path '/' file];
    
    currentFile = load_untouch_nii(fullFile);
    currentFileData = currentFile.img;
    niftiData = reshape(currentFileData,size(currentFileData,1)*size(currentFileData,2)*size(currentFileData,3),1);
    load totalMat.mat
    totalMat(:,randi) = niftiData;
    
    if ~mod(randi,10) == 1
        save totalMat.mat totalMat -v7.3
    end
end