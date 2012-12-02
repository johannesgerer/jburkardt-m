function [a,n,r,epe,eph,epw,usol_c,vsol_c] = mg_ns_q1cd(xy,ev,flowsol,domain,lncoarse,lnfine,outbnd)
%mg_ns_q1cd   convection-diffusion matrix generator for GMG (Navier-Stokes)
%   [a,n,r,epe,eph,epw,usol_c,vsol_c] = mg_ns_q1cd(xy,ev,flowsol,domain,lncoarse,lnfine,outbnd)  
%   input
%           xy         vertex coordinate vector  
%           ev         element mapping matrix
%           flowsol    current velocity field
%           domain     domain parameter, 1 for square, 3 for step
%           lncoarse   coarse grid index, log2(nc) for nc x nc square grid
%           lnfine     finest grid index, log2(nf) for nf x nf square grid
%           outbnd     location of outflow boundary
%   output 
%           a          discrete diffusion operator
%           n          discrete convection operator
%           r          mass matrix
%           epe        viscosity normalised element peclet numbers 
%           eph        flow specific element lengths 
%           epw        centroid evaluated wind 
%           usol_c     first convection coefficient on coarse grid nodes
%           vsol_c     second convection coefficient on coarse grid nodes 
%
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

% Modification of DJS routine mg_q1cd to allow convection coefficients to 
% be passed via flowsol.  Analogous to femq1_cd.

% Square domain
if domain==1, 
% Size of fine grid, obtained from underlying flow solution flowsol
   nfine  = length(flowsol)/2;
   nf = sqrt(nfine);
   x=xy(:,1); y=xy(:,2);
   nvtx=length(x);   nel=length(ev(:,1));

% Get flow values at coarse grid points
   lshift = lnfine - lncoarse;
   usol=flowsol(1:nfine); 
   usol_grid = reshape(usol,nf,nf);
   usol_grid_c = usol_grid(1:2^lshift:nf,1:2^lshift:nf);
   usol_c = reshape(usol_grid_c,nvtx,1);
   vsol=flowsol(nfine+1:2*nfine); 
   vsol_grid = reshape(vsol,nf,nf);
   vsol_grid_c = vsol_grid(1:2^lshift:nf,1:2^lshift:nf);
   vsol_c = reshape(vsol_grid_c,nvtx,1);

% Step domain
elseif domain==3,
% Various counts of fine/coarse points in small part (1) and large part (2) of step
% Logic borrowed from AR routine step_mg_prolong
   nelf = 2^lnfine;
   nfine = (((outbnd+1)/2)*nelf+1)*(nelf+1) - (nelf/2)^2;
   nelc = 2^lncoarse;
   ncoarse = (((outbnd+1)/2)*nelc+1)*(nelc+1) - (nelc/2)^2;
   nfh1 = (nelf/2);     nfv1 = (nelf/2+1);  nf1 = nfh1*nfv1;
   nfh2 = (outbnd*nelf/2+1); nfv2 = nelf+1; nf2 = nfh2*nfv2;
   nch1 = (nelc/2);     ncv1 = (nelc/2+1);  nc1 = nch1*ncv1;
   nch2 = (outbnd*nelc/2+1); ncv2 = nelc+1; nc2 = nch2*ncv2;

% Get flow values at coarse grid points
   lshift = lnfine-lncoarse;
   usol=flowsol(1:nfine);
   usol1_grid = reshape(usol(1:nf1),nfh1,nfv1);
   usol1_grid_c = usol1_grid(1:2^lshift:nfh1,1:2^lshift:nfv1);
   usol1_c = reshape(usol1_grid_c,nc1,1);
   usol2_grid = reshape(usol(nf1+1:nfine),nfh2,nfv2);
   usol2_grid_c = usol2_grid(1:2^lshift:nfh2,1:2^lshift:nfv2);
   usol2_c = reshape(usol2_grid_c,nc2,1);
   usol_c = [usol1_c;usol2_c];
   vsol=flowsol(nfine+1:2*nfine);
   vsol1_grid = reshape(vsol(1:nf1),nfh1,nfv1);
   vsol1_grid_c = vsol1_grid(1:2^lshift:nfh1,1:2^lshift:nfv1);
   vsol1_c = reshape(vsol1_grid_c,nc1,1);
   vsol2_grid = reshape(vsol(nf1+1:nfine),nfh2,nfv2);
   vsol2_grid_c = vsol2_grid(1:2^lshift:nfh2,1:2^lshift:nfv2);
   vsol2_c = reshape(vsol2_grid_c,nc2,1);
   vsol_c = [vsol1_c;vsol2_c];
end

%
x=xy(:,1); y=xy(:,2);
nvtx=length(x);
nel=length(ev(:,1));
lx=max(x)-min(x); ly=max(y)-min(y);
hx=max(diff(x)); hy=max(diff(y));
%
% Initialise global matrices
a = sparse(nvtx,nvtx);
n = sparse(nvtx,nvtx);
r = sparse(nvtx,nvtx);
%
% Set up 2x2 Gauss points
gpt=1.0e0/sqrt(3.0e0);
s(1) = -gpt;  t(1) = -gpt;   wt(1) = 1;
s(2) =  gpt;  t(2) = -gpt;   wt(2) = 1;
s(3) =  gpt;  t(3) =  gpt;   wt(3) = 1;
s(4) = -gpt;  t(4) =  gpt;   wt(4) = 1;

%
% Inner loop over elements    
for ivtx = 1:4
   xl_v(:,ivtx) = x(ev(:,ivtx));
   yl_v(:,ivtx) = y(ev(:,ivtx)); 
   xsl(:,ivtx) = usol_c(ev(:,ivtx));
   ysl(:,ivtx) = vsol_c(ev(:,ivtx));
end
ae = zeros(nel,4,4);
ne = zeros(nel,4,4);
re = zeros(nel,4,4);
% Loop over 2x2 Gauss points
for igpt = 1:4
   sigpt=s(igpt);
   tigpt=t(igpt);
   wght=wt(igpt);
%  Evaluate derivatives etc
   [jac,invjac,phi,dphidx,dphidy] = deriv(sigpt,tigpt,xl_v,yl_v);
   u_x = zeros(nel,1); u_y=zeros(nel,1);
   for k=1:4
      u_x(:) = u_x(:) + xsl(:,k) .* phi(:,k);
      u_y(:) = u_y(:) + ysl(:,k) .* phi(:,k);	 
   end         
   for j = 1:4
      for i = 1:4
          ae(:,i,j) = ae(:,i,j)  + dphidx(:,i).*dphidx(:,j) .* invjac(:);
          ae(:,i,j) = ae(:,i,j)  + dphidy(:,i).*dphidy(:,j) .* invjac(:);
          re(:,i,j) = re(:,i,j)  + phi(:,i).*phi(:,j) .* jac(:);
%%%       ne(:,i,j) = ne(:,i,j) + flowx(:) .* phi(:,i) .* dphidx(:,j);
%%%       ne(:,i,j) = ne(:,i,j) + flowy(:) .* phi(:,i) .* dphidy(:,j);
          ne(:,i,j)  = ne(:,i,j)  + wght*u_x(:).*phi(:,i).*dphidx(:,j);
          ne(:,i,j)  = ne(:,i,j)  + wght*u_y(:).*phi(:,i).*dphidy(:,j);
       end
	end
% End of Gauss point loop
end
%
% Perform assembly of global matrix  and source vector 
for krow=1:4
   nrow=ev(:,krow);	 
   for kcol=1:4
      ncol=ev(:,kcol);	  
      a = a + sparse(nrow,ncol,ae(:,krow,kcol),nvtx,nvtx);
      r = r + sparse(nrow,ncol,re(:,krow,kcol),nvtx,nvtx);
      n = n + sparse(nrow,ncol,ne(:,krow,kcol),nvtx,nvtx);
   end
end
%
% Computation of element Peclet number (at the centroid)         
% Rectangle specific calculation here
hx=abs(xl_v(:,2)-xl_v(:,1)); hy=abs(yl_v(:,3)-yl_v(:,2));
[jac,invjac,phi,dphidx,dphidy] = deriv(0,0,xl_v,yl_v);
u_x = zeros(nel,1); u_y=zeros(nel,1);
for k=1:4
   u_x(:) = u_x(:) + xsl(:,k) .* phi(:,k);
   u_y(:) = u_y(:) + ysl(:,k) .* phi(:,k);	 
end         
flowx = u_x(:);   flowy = u_y(:);
flow_l2 = sqrt(flowx(:) .* flowx(:) + flowy(:) .* flowy(:));
if all(flowx==0), flow_h=hy;
elseif all(flowy==0), flow_h=hx;
else
   angle = atan(abs(flowy./flowx));
   flow_h = min([hx./cos(angle),hy./sin(angle)],[],2);
end
eph = flow_h;
epe = flow_h.*flow_l2/2;
epw = flow_l2;
