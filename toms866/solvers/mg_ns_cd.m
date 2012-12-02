function mgdata = mg_ns_cd(domain,viscosity,flowsol,outbnd)
%mg_ns_cd   GMG for convection-diffusion problem  (Navier-Stokes)
%   mgdata = mg_ns_cd(domain,viscosity,flowsol,outbnd)
%   input
%          domain       domain information, 1 for cavity, 3 for step
%          viscosity    viscosity in NS equations
%          flowsol      current velocity solution iterate
%          outbnd       location of outflow boundary (for step)
%   output
%          mgdata       structure containing GMG data at all levels
%             matrix    discrete convection-diffusion operators 
%             prolong   grid transfer operators 
%             smoother  structure containing smoothing operators
%             nc        grid parameter identifying finest level
%
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

fprintf('Setting up MG data ...')

if domain==1,   % Cavity
   n  = sqrt(length(flowsol)/2);
   nc = log2(n-1);
   grid_type = 1;
   
% Smoothing strategy 
   sweeps=4; smooth=2; stype=2;  % Means four (sweeps)-directional line (stype) GS (smooth)
   
%  Top level
   %mgdata(nc).matrix=A;
   [x,y,xy,mv,mp,bound] = mg_cavity_domain(nc,grid_type);        
   mgdata(nc).matrix = mg_ns_cd_setup(x,y,viscosity,flowsol, domain,nc,nc,outbnd);
   mgdata(nc).prolong=mg_prolong(2^nc,2^nc,x,y);
   mgdata(nc).smoother = mg_ns_smooth(mgdata(nc).matrix,sweeps,smooth,stype);
   mgdata(nc).nc = nc;  % Not used, saved to be consistent with domain=3

%  x=x(1:2:end);y=y(1:2:end);
   %%% loop over remaining levels
   for level = nc-1:-1:1;
      [x,y,xy,mv,mp,bound] = mg_cavity_domain(level,grid_type); 
      mgdata(level).matrix=mg_ns_cd_setup(x,y,viscosity,flowsol, domain,level,nc,outbnd);
      mgdata(level).prolong=mg_prolong(2^level,2^level,x,y);
      mgdata(level).smoother = mg_ns_smooth(mgdata(level).matrix,sweeps,smooth,stype);
      mgdata(level).nc = nc;
   end

elseif domain==3,   % Step
% Get grid parameter nc 
   nu = length(flowsol)/2;
   xi = (-(outbnd+3)+sqrt((outbnd+3)^2+4*(2*outbnd+1)*(nu-1))) ...
          / (2*(2*outbnd+1));
   nc = log2(2*xi);
      
% Smoothing strategy 
   sweeps=1; smooth=3; stype=1; % Means one (sweeps)-directional point (stype) ILU (smooth)
   
   % Top level
   [x,y,xy,mv,mp,bound] = mg_step_domain(nc,outbnd);
   mgdata(nc).matrix = mg_ns_cd_setup(x,y,viscosity,flowsol, domain,nc,nc,outbnd);
   x=x'; y=y'; mgdata(nc).prolong=mg_ns_prolong_step(nc,x,y,outbnd);  x=x'; y=y';
   mgdata(nc).smoother = mg_ns_smooth(mgdata(nc).matrix,sweeps,smooth,stype);
   mgdata(nc).nc = nc;
   
   %%% loop over remaining levels
   for level = nc-1:-1:2;
      [x,y,xy,mv,mp,bound] = mg_step_domain(level,outbnd);
      mgdata(level).matrix=mg_ns_cd_setup(x,y,viscosity,flowsol, domain,level,nc,outbnd);
      x=x'; y=y'; mgdata(level).prolong=mg_ns_prolong_step(level,x,y,outbnd); x=x'; y=y';
      mgdata(level).smoother = mg_ns_smooth(mgdata(level).matrix,sweeps,smooth,stype);
      mgdata(level).nc = nc;
   end
else
   error('Error, mg_data_cd_ns defined only for cavity or step\n');
end

fprintf('done\n');
