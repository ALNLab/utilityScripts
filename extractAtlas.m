function extractAtlas(regionIndices,atlas)

atlasNifti = load_untouch_nii(atlas);
template = atlasNifti; 
mkdir([pwd '/atlasExtracted'])

for i = 1:length(regionIndices)
    tmpExtract = find(atlasNifti.img == regionIndices(i));
    niftiMat = zeros(size(atlasNifti.img));
    niftiMat(tmpExtract) = i;
    template.img = niftiMat;
    save_untouch_nii(template,[pwd '/atlasExtracted/Extracted_' num2str(regionIndices(i)) '_BinarizedValue' num2str(i)])
end

