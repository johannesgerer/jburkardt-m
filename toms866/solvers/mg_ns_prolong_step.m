function P=mg_ns_prolong_step(nc,x,y,outbnd)
%mg_ns_prolong_step  GMG prolongation operator for step domain (Navier-Stokes)
%   P=mg_ns_prolong_step(nc,x,y,outbnd)
%   input
%          nc      grid parameter
%          x       x coordinate vector for coarse grid
%          y       y coordinate vector for coarse grid
%          outbnd  location of outflow boundary
%   output
%          P       prolongation operator
%
%   IFISS function: HCE; 5 May 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

nelf=2^nc;nelc=nelf/2;nelcx=outbnd*nelc;
nnf=(nelc+1)*((outbnd+1)*nelc+1)+nelc*(outbnd*nelc+1);
nnc=(nelc/2+1)*(((outbnd+1)/2)*nelc+1)+(nelc/2)*(outbnd*nelc/2+1);

% split coordinates 
x1=x(1:nelc+1); x2=x(nelc+1:end);
y1=y(nelc+1:end); y2=y;

% block size
nnf1=nelc*(nelc+1);
nnc1=nelc/2*(nelc/2+1);

start_col=(nelc/2+1)*(nelc/2+1);

% Prolongation matrix has the form 
% P = [P_1, 0, P_2]
%     [   0 ,  P_3]

% nonzero components of upper block, for upper left of step and coupling
[P_1,P_2]=mg_ellblock(nelc,nelc,x1,y1);
% P(1:nnf1,1:nnc1)=P_1;                % upper block
% P(1:nnf1,nnc-start_col+1:nnc)=P_2;   % coupling

% nonzero component of lower block
P_3=mg_prolong(nelcx,nelf,x2,y2);
% P(nnf1+1:end,nnc1+1:end)=P_3;

P = [[P_1,sparse(nnf1,nnc-start_col-nnc1),P_2];[sparse(nnf-nnf1,nnc1),P_3]];
