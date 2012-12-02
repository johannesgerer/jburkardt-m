function Ap = mg_apsetup_q1(xy,xyp,mv,mp,domain)
%mg_apsetup_q1  Q1 pressure diffusion matrix for GMG
%   Ap = mg_apsetup_q1(xy,xyp,mv,mp,domain);
%   input
%          xy         Q2 nodal coordinate vector 
%          xyp        Q1 element coordinate vector
%          mv         Q2 element mapping matrix
%          mp         Q1 element mapping matrix
%          domain     domain index
%   output
%          Ap         Q1 scalar diffusion matrix
%   IFISS function: HCE; 18 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

%   modelled after fpsetup_q1
nngpt=4; 
x=xy(:,1); y=xy(:,2);
xp=xyp(:,1); yp=xyp(:,2);
nvtx=length(x); nu=2*nvtx; np=length(xp);
nel=length(mv(:,1));

% Initialise global matrix
Ap = sparse(np,np);

% Gauss point integration rules
if (nngpt==4)        % 2x2 Gauss points
   gpt=1.0e0/sqrt(3.0e0);
   s(1) = -gpt; t(1) = -gpt; wt(1)=1;
   s(2) =  gpt; t(2) = -gpt; wt(2)=1;
   s(3) =  gpt; t(3) =  gpt; wt(3)=1; 
   s(4) = -gpt; t(4) =  gpt; wt(4)=1;
elseif (nngpt==1)   % 1x1 Gauss point
   s(1) =    0; t(1) =    0; wt(1)=4;
else
   error('Check Gauss point integration specification')
end
%
% Inner loop over elements    
for ivtx = 1:4
   xl_v(:,ivtx) = x(mv(:,ivtx));
   yl_v(:,ivtx) = y(mv(:,ivtx)); 
end
ae = zeros(nel,4,4);
% 
% Loop over Gauss points
for igpt = 1:nngpt
   sigpt=s(igpt);
   tigpt=t(igpt);
   wght=wt(igpt);
% Evaluate derivatives etc
   [jac,invjac,phi,dphidx,dphidy] = deriv(sigpt,tigpt,xl_v,yl_v);
   for j = 1:4
      for i = 1:4    
         ae(:,i,j)  = ae(:,i,j)  + wght*dphidx(:,i).*dphidx(:,j).*invjac(:);
         ae(:,i,j)  = ae(:,i,j)  + wght*dphidy(:,i).*dphidy(:,j).*invjac(:);
      end
   end
% End of Gauss point loop
end  
%
%%  Element assembly into global matrix
for krow=1:4
   nrow=mp(:,krow);	 
   for kcol=1:4
      ncol=mp(:,kcol);	  
      Ap = Ap + sparse(nrow,ncol,ae(:,krow,kcol),np,np);
   end
end

%%% fix inflow pressures for the step domain system
if domain == 3,
   bound=find(xyp(:,1)==-1);
   fprintf('fixed pressure on inflow boundary\n')
   nbd=length(bound); 
   null_col=sparse(np,nbd); null_row=sparse(nbd,np);
   dA=zeros(np,1); dA(bound)=ones(nbd,1);
   Ap(:,bound)=null_col;  Ap(bound,:)=null_row; 
   Ap = Ap+spdiags(dA,0,np,np);
%else
%%% fix hydrostatic pressure
%  fprintf('fixed hydrostatic pressure\n')
%  null_col=sparse(np,1); null_row=sparse(1,np);
%  Ap(:,np)=null_col;  Ap(np,:)=null_row;   Ap(np,np)=1; 
end
