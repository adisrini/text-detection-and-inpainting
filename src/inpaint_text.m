function inpaint_text( filename )

%% Load image and mask
image = strcat('../inputs/', filename);

detect_edges(filename);

mask = strcat('../masks/', filename);

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
im1 = imread(strcat('../inputs/', filename));
im2 = imread(strcat('../outputs/output_', filename_no_filetype, '_mumford_shah.png'));
im3 = imsharpen(im2);
imshowpair(im1, im2, 'montage');

end

