function [a,f] = fpsetup_q0(xy,xyp,ev,ee,flowsol,viscosity,domain)
%fpsetup_q0  Q0 pressure convection-diffusion matrix 
%   [Ap,Fp] = fpsetup_q0(xy,xyp,ev,ee,flowsol,viscosity,domain);
%   input
%          xy         Q2 nodal coordinate vector 
%          xyp        Q0 element coordinate vector
%          ev         element mapping matrix
%          ee         element edge index vector
%          flowsol    Q1-Q1 or Q1_P0 flow solution
%          viscosity  viscosity parameter
%          domain     domain index
%   output
%          Ap         Q0 scalar diffusion matrix
%          Fp         Q0 scalar convection-diffusion matrix
%
%   Rows and columns are pinned for all nodes on inflow boundaries.
%   Coding assumes a uniform grid: for a nonuniform grid hx and hy
%   must be computed locally.
%   IFISS function: DJS; 11 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
nngpt=4; 
x=xy(:,1); y=xy(:,2);
xp=xyp(:,1); yp=xyp(:,2);
nvtx=length(x); nu=2*nvtx; np=length(xp);
nel=length(ev(:,1));
usol=flowsol(1:nvtx); vsol=flowsol(nvtx+1:2*nvtx); 
fprintf('setting up Q0 pressure preconditioning matrices... \n')
hx=xp(2)-xp(1); hy=yp(3)-yp(2);
fprintf('uniform grid code: hx is %g and hy is %g \n', hx,hy)
%
% initialise global matrices
      a = sparse(np,np);
	  f = sparse(np,np);
%
%
%% remove zero indices corresponding to boundary edges
        ppk=[1:nel]'; onecol=ones(nel,1); 
% find boundary edges
		iie=ee==0;
        eex=ee + ( ee==0).* [ppk,ppk,ppk,ppk];
%
%% form the pressure Laplacian and convection-diffusion matrix
%
% inner loop over elements    
        for ivtx = 1:4
%        xl_v(:,ivtx) = x(ev(:,ivtx));
%        yl_v(:,ivtx) = y(ev(:,ivtx)); 
        xsl_v(:,ivtx) = usol(ev(:,ivtx));
		ysl_v(:,ivtx) = vsol(ev(:,ivtx));
		end
% evaluate normal velocity on each edge in turn 
%% nx= 0, ny=-1  
		wind_y = -0.5*(ysl_v(:,1)+ysl_v(:,2))*0.5*hx;
		f=f + sparse(1:nel,eex(:,1), wind_y,nel,nel);
        f=f + sparse(1:nel,1:nel,   -wind_y,nel,nel);
		a=a + sparse(1:nel,eex(:,1),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= 1, ny=0  
		wind_x = 0.5*(xsl_v(:,2)+xsl_v(:,3))*0.5*hy;
		f=f + sparse(1:nel,eex(:,2),  wind_x,nel,nel);
        f=f + sparse(1:nel,1:nel,    -wind_x,nel,nel);
		a=a + sparse(1:nel,eex(:,2),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= 0, ny=1  
		wind_y = 0.5*(ysl_v(:,3)+ysl_v(:,4))*0.5*hx;
		f=f + sparse(1:nel,eex(:,3), wind_y,nel,nel);
        f=f + sparse(1:nel,1:nel,   -wind_y,nel,nel);
		a=a + sparse(1:nel,eex(:,3),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= -1, ny=0  
		wind_x = -0.5*(xsl_v(:,1)+xsl_v(:,4))*0.5*hy;
		f=f + sparse(1:nel,eex(:,4), wind_x,nel,nel);
        f=f + sparse(1:nel,1:nel,   -wind_x,nel,nel);
		a=a + sparse(1:nel,eex(:,4),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%
     f = viscosity*a + f;
%%
%%% fix inflow pressures for the step/pipe domain system
if domain == 3 | domain == 10
   fprintf('fixed pressure on inflow boundary\n')
   bound=find(xyp(:,1)==-1+hx/2);
   nbd=length(bound); 
   null_col=sparse(np,nbd); null_row=sparse(nbd,np);
   dA=zeros(np,1); dA(bound)=ones(nbd,1);
   f(:,bound)=null_col;  f(bound,:)=null_row;   
   f=f+spdiags(dA,0,np,np);   
   a(:,bound)=null_col;  a(bound,:)=null_row;   
   a=a+spdiags(dA,0,np,np); 
   n_null = 0;
else
   fprintf('singular matrices are used here\n')
   %fprintf('fixed hydrostatic pressure\n')
   %null_col=sparse(np,1); null_row=sparse(1,np);
   %f(:,np)=null_col;  f(np,:)=null_row;   f(np,np)=1;  
   %a(:,np)=null_col;  a(np,:)=null_row;   a(np,np)=1;   
end
return
