function mask = otsu_threshold( filename, dilation )

I = imread(strcat('../inputs/', filename));
I = im2double(I(:, :, :));
HSV = rgb2hsv(I);
H = HSV(:,:,1); H = H(:);
S = HSV(:,:,2); S = S(:);
V = HSV(:,:,3); V = V(:);
idx = kmeans([H S V], 2);
Iotsu = reshape(idx, size(I, 1), size(I, 2));
SE = strel('square', dilation);
mask = ind2rgb(imdilate(Iotsu, SE), [0 0 0; 1 1 1]);
imwrite(mask, strcat('../masks/', filename));

end

