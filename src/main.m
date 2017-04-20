%% Deprecated with New GUI


%% Load image and mask
image = '../inputs/swan.jpg';
mask  = '../masks/swan.jpg';

%% Set parameters for inpainting
tol           = 1e-5;
maxiter       = 50;
dt            = 0.1;
param.M       = 40; % number of steps of the inpainting procedure;
param.N       = 2;  % number of steps of the anisotropic diffusion;
param.eps     = 1e-10;

inpainting_transport(image, mask, maxiter, tol, dt, param);