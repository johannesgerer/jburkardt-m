function param = p_data()

% Set parameter values for unsteady conduction on a rectangular domain


%% Geometric parameters  
  param.L  = 10;  % domain length
  param.W  =  4;  % domain width
  param.nodesx =   51;
  param.nodesy =   51;
  
%% conductivity values 
  param.k_x = 1.0;
  param.k_y = 1.0;
  
%% 
  dt = 2.; sigma = 1; Cp = 1;
  param.dt = dt/(sigma*Cp);
  
%%  values for piecewise constant parameters on left boundary
%  k \partial u/partial x = alpha(y) ( u(y) - beta(y) )
%  Data for a step function with value alpha(y)/beta(y)
%  for y in an ep(i) nbhd of yh(i)

  param.yh    = [ 1  2  3];   % center y value(s)
  param.ep    = [.2 .4 .2];   % interval half-width(s)
  param.alpha = [4. 2. 4.];   % alpha value(s)
  param.beta  = [35  0 35];   % beta value(s)

% sensitivity data on left boundary
% here q=2 is the  value of alpha on the middle interval
  param.alph_q= [0. 1. 0.]; % sensitivity of alpha wrt q
  param.beta_q= [0. 0. 0.]; % sensitivity of beta  wrt q
 
  
%%  constant, uniform flux on right boundary

   param.flux =  2; 
% sensitivity data on right boundary
   param.flux_q = 0;
   
%% parameters for Fourier mode
%    param.alpha = 2;
%    param.beta  = 5;
%    param.beta_ell = 3;

  return
end
