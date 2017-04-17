function inpaint_text( filename , text_detection_method, dilation, R, G, B )

%% Load image and mask
image = strcat('../inputs/', filename);

if strcmp(text_detection_method, 'edge')
    detect_edges(filename, dilation);
elseif strcmp(text_detection_method, 'otsu')
    otsu_threshold(filename, dilation);
elseif strcmp(text_detection_method, 'color-select')
    color_select_mask(filename,R,G,B);
elseif strcmp(text_detection_method, 'user-generated')
    % do nothing, use mask alread in ../masks/
end

I = imread(image);
I = image_shrink(I);
image = strcat('../inputs/small_', filename);
imwrite(I, image);

mask = strcat('../masks/', filename);
Im = imread(mask);
Im = image_shrink(Im);
mask = strcat('../masks/small_', filename);
imwrite(Im, mask);

%% Set parameters for inpainting
maxiter       = 20;
tol           = 1e-14;
param.lambda  = 10^9;   % weight on data fidelity (should usually be large).
param.alpha   = 1;      % regularisation parameters \alpha.
param.gamma   = 0.5;    % regularisation parameters \gamma.
param.epsilon = 0.05;   % accuracy of Ambrosio-Tortorelli approximation of the edge set.

inpainting_mumford_shah(image, mask, maxiter, tol, param);

%% Display images

filename_no_filetype = filename(1: ( strfind(filename,'.') - 1));
im1 = imread(strcat('../inputs/small_', filename));
im2 = imread(strcat('../outputs/output_small_', filename_no_filetype, '_mumford_shah.png'));
im3 = imsharpen(im2);
imshowpair(im1, im2, 'montage');

end

