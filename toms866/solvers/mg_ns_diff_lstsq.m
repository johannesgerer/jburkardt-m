function mgdata = mg_ns_diff_lstsq(BGiBt,domain,flowsol,qmethod,outbnd)
%mg_ns_diff_lstsq  GMG for diffusion problem (Navier-Stokes, least-squares)
%   mgdata = mg_ns_diff_lstsq(BGiBt,domain,flowsol,qmethod,outbnd)
%   input
%          BGiBt        top level discrete diffusion operator
%          domain       domain information, 1 for cavity, 3 for step
%          flowsol      current velocity solution iterate
%          qmethod      discretization method, 0 for Q1-Q1, 2 for Q2-Q1
%          outbnd       location of outflow boundary (for step)
%   output
%          mgdata       structure containing GMG data at all levels
%             matrix    discrete diffusion operators 
%             prolong   grid transfer operators 
%             smoother  structure containing smoothing operators
%             nc        grid parameter identifying finest level
%
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

if domain==1,      % Cavity
   np = sqrt(length(BGiBt));
   nc = log2(np-1);
   grid_type = 1;
   
% Smoothing strategy 
   sweeps=1; smooth=2; stype=2;  % Means one (sweeps)-directional line (stype) GS (smooth)
   
% Top level
% 
%  [x,y,xy,mv,mp,bound] = mg_cavity_domain(nc+1,grid_type);        
%  [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound); 
%  mgdata(nc).matrix = mg_apsetup_q1(xy,xyp,mv,mp,domain); 
   mgdata(nc).matrix = BGiBt.*(BGiBt~=0);      % BGiBt;
   if qmethod==2,
      [x,y,xy,mv,mp,bound] = mg_cavity_domain(nc,grid_type);        
      [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound);   
      mgdata(nc).prolong = mg_prolong(2^nc,2^nc,x,y); 
%  else % qmethod=0
%     mgdata(nc).prolong=mg_prolong(2^nc,2^nc,x,y); 
   end
   mgdata(nc).smoother = mg_ns_smooth(mgdata(nc).matrix,sweeps,smooth,stype);
   mgdata(nc).nc = nc;  % Not used, saved to be consistent with domain=3

   % Loop over remaining levels
   for level = nc-1:-1:2;
      if qmethod==2,
         %%% construct matrix        
%        mgdata(level).matrix = mg_apsetup_q1(xy,xyp,mv,mp,domain);
         [A,B,Q,G,Bx,By,f,g] = stokes_q2q1(xy,xyp,mv,mp);
         [Ast,Bst,fst,gst] = flowbc(A,B,f,g,xy,bound);
         nv = length(G);
         Gdiag=spdiags(diag(G),0,nv,nv);
%        mgdata(level).matrix = Bst*(Gdiag\Bst');
         S = Bst*(Gdiag\Bst');
         mgdata(level).matrix = S.*(S~=0);
         %%% construct prolongation operator
         [x,y,xy,mv,mp,bound] = mg_cavity_domain(level,grid_type);        
         [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound); 
         mgdata(level).prolong = mg_prolong(2^level,2^level,x,y);
%     else % qmethod=0
%        [x,y,xy,mv,mp,bound] = mg_cavity_domain(level+1,grid_type);        
%        [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound); 
%        mgdata(level).matrix = mg_apsetup_q1(xy,xyp,mv,mp,domain); 
%        mgdata(level).prolong=mg_prolong(2^level,2^level,x,y);
      end
      mgdata(level).smoother = mg_ns_smooth(mgdata(level).matrix,sweeps,smooth,stype);
      mgdata(level).nc = nc;
   end

elseif domain==3,     % Step
   nu = length(flowsol)/2;
   xi = (-(outbnd+3)+sqrt((outbnd+3)^2+4*(2*outbnd+1)*(nu-1))) ...
          / (2*(2*outbnd+1));
   nc = log2(2*xi);
   
% Smoothing strategy 
   sweeps=1; smooth=3; stype=1; % Means one (sweeps)-directional point (stype) ILU (smooth)

% top level
   [x,y,xy,mv,mp,bound] = mg_step_domain(nc,outbnd);
   mgdata(nc).matrix = BGiBt.*(BGiBt~=0);     %BGiBt;
   if qmethod==2,
      x=x(1:2:end)'; y=y(1:2:end)'; 
      mgdata(nc).prolong=mg_ns_prolong_step(nc-1,x,y,outbnd);  
   else % qmethod=0
      x=x'; y=y';
      mgdata(nc).prolong=mg_ns_prolong_step(nc,x,y,outbnd); 
   end
   mgdata(nc).smoother = mg_ns_smooth(mgdata(nc).matrix,sweeps,smooth,stype);
   mgdata(nc).nc = nc;

   %%% loop over remaining levels
   for level = nc-1:-1:2;
      if qmethod==2,
         [x,y,xy,mv,mp,bound] = mg_step_domain(level,outbnd);   
         [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound);   
%        mgdata(level).matrix = mg_apsetup_q1(xy,xyp,mv,mp,domain);
         [A,B,Q,G,Bx,By,f,g] = stokes_q2q1(xy,xyp,mv,mp);
         [Ast,Bst,fst,gst] = flowbc(A,B,f,g,xy,bound);
         nv = length(G);
         Gdiag=spdiags(diag(G),0,nv,nv);
%        mgdata(level).matrix = Bst*(Gdiag\Bst');
         S = Bst*(Gdiag\Bst');
         mgdata(level).matrix = S.*(S~=0);
         if level>2,
            x=x(1:2:end)'; y=y(1:2:end)'; 
            mgdata(level).prolong=mg_ns_prolong_step(level-1,x,y,outbnd);
         end
%     else % qmethod=0
%        [x,y,xy,xyp] = mg_diff_q2q1grid(x,y,xy,mv,mp,bound); 
%        mgdata(level).matrix = mg_apsetup_q1(xy,xyp,mv,mp,domain);
%        [x,y,xy,mv,mp,bound] = mg_step_domain(level,outbnd);   
%        x=x'; y=y';
%        mgdata(level).prolong = mg_ns_prolong_step(level,x,y,outbnd);
      end
      mgdata(level).smoother = mg_ns_smooth(mgdata(level).matrix,sweeps,smooth,stype);
      mgdata(level).nc = nc;
   end
else
   error('Error, mg_ns_diff_lstsq is defined only for cavity and step\n');
end
