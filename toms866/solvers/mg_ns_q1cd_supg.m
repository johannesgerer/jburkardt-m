function d = mg_ns_q1cd_supg(xy,ev,expe,eph,epw,usol_c,vsol_c)
%mg_ns_q1cd_supg  streamline diffusion matrix generator for GMG (Navier-Stokes)
%   d = mg_ns_q1cd_supg(xy,ev,expe,eph,epw,usol_c,vsol_c)
%   input
%           xy         vertex coordinate vector  
%           ev         element mapping matrix
%           expe       element peclet numbers        
%           eph        flow specific element lengths 
%           epw        centroid evaluated wind 
%           usol_c     horizontal component of discrete flow field
%           vsol_c     vertical component of discrete flow field
%   output 
%           d          discrete streamline diffusion operator
%
%   IFISS function: HCE; 19 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

% Modification of DJS routine mg_q1cd_supg to allow convection coefficients to 
% be passed via usol_c, vsol_c.  Analogous to femq1_cd_supg.

x=xy(:,1); y=xy(:,2);
nvtx=length(x);
nel=length(ev(:,1));
%
% find the elements where streamline diffusion is active
acte = find(isfinite(expe)); nacte=length(acte);
%
% initialise global matrices
d = sparse(nvtx,nvtx);
%
% set up 2x2 Gauss points
gpt=1.0e0/sqrt(3.0e0);
s(1) = -gpt;  t(1) = -gpt;   wt(1) = 1;
s(2) =  gpt;  t(2) = -gpt;   wt(2) = 1;
s(3) =  gpt;  t(3) =  gpt;   wt(3) = 1;
s(4) = -gpt;  t(4) =  gpt;   wt(4) = 1;
%
% loop over active and inactive elements    
%      for iact = 1:nacte
% ielem = acte(iact);
% inner loop over elements    
for ivtx = 1:4
   xl_v(:,ivtx) = x(ev(:,ivtx));
   yl_v(:,ivtx) = y(ev(:,ivtx)); 
   xsl(:,ivtx) = usol_c(ev(:,ivtx));
   ysl(:,ivtx) = vsol_c(ev(:,ivtx));    
end
de = zeros(nel,4,4);
% loop over 2x2 Gauss points
for igpt = 1:4
   sigpt=s(igpt);
   tigpt=t(igpt);
   wght=wt(igpt);
%  evaluate derivatives etc
   [jac,invjac,phi,dphidx,dphidy] = deriv(sigpt,tigpt,xl_v,yl_v);
%  [flowx,flowy] = fast_gauss_transprt(sigpt,tigpt,xl_v,yl_v);
   u_x = zeros(nel,1); u_y=zeros(nel,1);
   for k=1:4
      u_x(:) = u_x(:) + xsl(:,k) .* phi(:,k);
      u_y(:) = u_y(:) + ysl(:,k) .* phi(:,k);	 
   end         
   for j = 1:4
      for i = 1:4
%        de(:,i,j) = de(:,i,j) + flowx(:).*dphidx(:,i).*flowx(:).*dphidx(:,j).*invjac(:);
%        de(:,i,j) = de(:,i,j) + flowy(:).*dphidy(:,i).*flowx(:).*dphidx(:,j).*invjac(:);
%        de(:,i,j) = de(:,i,j) + flowx(:).*dphidx(:,i).*flowy(:).*dphidy(:,j).*invjac(:);
%        de(:,i,j) = de(:,i,j) + flowy(:).*dphidy(:,i).*flowy(:).*dphidy(:,j).*invjac(:);
         de(:,i,j) = de(:,i,j) + (wght*u_x(:)).*dphidx(:,i).*(wght*u_x(:)).*dphidx(:,j).*invjac(:);
         de(:,i,j) = de(:,i,j) + (wght*u_y(:)).*dphidy(:,i).*(wght*u_x(:)).*dphidx(:,j).*invjac(:);
         de(:,i,j) = de(:,i,j) + (wght*u_x(:)).*dphidx(:,i).*(wght*u_y(:)).*dphidy(:,j).*invjac(:);
         de(:,i,j) = de(:,i,j) + (wght*u_y(:)).*dphidy(:,i).*(wght*u_y(:)).*dphidy(:,j).*invjac(:);
      end
   end
% end of Gauss point loop
end
%
% scale with the appropriate parameter
acte = find(isfinite(expe));
factor = expe(acte); flow_h=eph(acte); flow_l2=epw(acte);
lpe =zeros(nel,1); lpe(acte)= factor.*(flow_h./flow_l2);
for j = 1:4
   for i = 1:4
      de(:,i,j) = lpe(:) .* de(:,i,j);
   end
end
%   
% perform assembly of global matrix  and source vector 
for krow=1:4
   nrow=ev(:,krow);	 
   for kcol=1:4
      ncol=ev(:,kcol);	  
      d = d + sparse(nrow,ncol,de(:,krow,kcol),nvtx,nvtx);
   end
end
