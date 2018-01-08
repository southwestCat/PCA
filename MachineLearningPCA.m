clear,clc
imgSize = 100;
imgNum = 165;
filePath = '.\yale\s';
feature = zeros(imgSize*imgSize,imgNum);
for i = 1:imgNum
    Path = strcat(filePath,num2str(i),".bmp");
    img = imread(char(Path));
%     img = img';
    feature(:,i) = double(img(:));
end
% mean_feature = mean(feature,2);
% mean_face = uint8(reshape(mean_feature,imgSize,imgSize));
% imshow(mean_face);
[pc,score,latent,tsquare] = pca(feature);
feature_after_PCA = uint8(score(:,1:20));
for i =1:20
    figure(i)
    face = uint8(reshape(feature_after_PCA(:,i),imgSize,imgSize));
    imshow(face)
end
