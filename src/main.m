imagefilename = 'input.png';
maskfilename  = 'input-mask.png';

% PARAMETERS
maxiter       = 20;
tol           = 1e-14;
param.lambda  = 10^9;   % weight on data fidelity (should usually be large).
param.alpha   = 1;  % regularisation parameters \alpha.
param.gamma   = 0.5;    % regularisation parameters \gamma.
param.epsilon = 0.05;    % accuracy of Ambrosio-Tortorelli approximation of the edge set.

inpainting_mumford_shah(imagefilename,maskfilename,maxiter,tol,param)