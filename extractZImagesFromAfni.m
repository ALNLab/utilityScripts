function [outFolder] = extractZImagesFromAfni(inFolder)

if isempty(inFolder)
    inFiles = uipickfiles;
    outFolder = [pwd '/zImages'];
else
    inFiles = dir([inFolder '/*.nii']);
    scratch = findstr(inFolder,'/');
    outFolder = [inFolder(1:scratch(end)) 'zImages'];
end

mkdir(outFolder)
for i = 1:length(inFiles)
    disp(['Working on ' num2str(i) ' of ' num2str(length(inFiles))])
    tmp = load_untouch_nii([inFolder '/' inFiles(i).name]);
    tmp.img = tmp.img(:,:,:,:,2);
    scratch = findstr(tmp.fileprefix,'/');
    tmp.hdr.dime.dim = [5 62 78 63 1 1 1 1];
    save_untouch_nii(tmp,[outFolder '/' inFiles(i).name])
end

for i = 1:length(inFiles)
    disp(['Working on ' num2str(i) ' of ' num2str(length(inFiles))])
    tmp = load_untouch_nii([inFolder '/' inFiles(i).name]);
    tmp.img = tmp.img(:,:,:,:,1);
    scratch = findstr(tmp.fileprefix,'/');
    tmp.hdr.dime.dim = [5 62 78 63 1 1 1 1];
    save_untouch_nii(tmp,[outFolder '/' inFiles(i).name])
end






%%if convert to 2mm first, then trim the extra image:
for i = 1:length(inFiles)
    disp(['Working on ' num2str(i) ' of ' num2str(length(inFiles))])
    tmp = load_untouch_nii([inFolder '/' inFiles(i).name]);
    tmp.img = tmp.img(:,:,:,2);
    scratch = findstr(tmp.fileprefix,'/');
    save_untouch_nii(tmp,[outFolder '/' inFiles(i).name])
end