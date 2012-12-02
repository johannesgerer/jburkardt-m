function [av,fv] = fpsetup_q2p1(xy,xyp,mv,ee,flowsol,viscosity,domain)
%fpsetup_q2p1  P1 pressure convection-diffusion matrix 
%   [Ap,Fp] = fpsetup_q2p1(xy,xyp,mv,ee,flowsol,viscosity,domain);
%   input
%          xy         Q2 nodal coordinate vector 
%          xyp        Q0 element coordinate vector
%          mv         Q2 element mapping matrix
%          ee         element edge index vector
%          flowsol    Q1-Q1 or Q1-P0 flow solution
%          viscosity  viscosity parameter
%          domain     domain index
%   output
%          Ap         P1 scalar diffusion matrix
%          Fp         P1 scalar convection-diffusion matrix
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
nel=length(mv(:,1));
usol=flowsol(1:nvtx); vsol=flowsol(nvtx+1:2*nvtx); 
fprintf('setting up Q2-P1 pressure preconditioning matrices... \n')
hx=max(diff(xp)); hy=max(diff(yp));
fprintf('uniform grid code: hx is %g and hy is %g \n', hx,hy)
%
% initialise global scalar matrices
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
        for ivtx = 1:9
%        xl_v(:,ivtx) = x(mv(:,ivtx));
%        yl_v(:,ivtx) = y(mv(:,ivtx)); 
        xsl_v(:,ivtx) = usol(mv(:,ivtx));
		ysl_v(:,ivtx) = vsol(mv(:,ivtx));
		end
% evaluate normal velocity on each edge in turn 
%% nx= 0, ny=-1  
		wind_y = -ysl_v(:,5)*0.5*hx;
		f=f + sparse(1:nel,eex(:,1), wind_y,nel,nel);
        f=f + sparse(1:nel,1:nel,   -wind_y,nel,nel);
		a=a + sparse(1:nel,eex(:,1),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= 1, ny=0  
		wind_x = xsl_v(:,6)*0.5*hy;
		f=f + sparse(1:nel,eex(:,2),  wind_x,nel,nel);
        f=f + sparse(1:nel,1:nel,    -wind_x,nel,nel);
		a=a + sparse(1:nel,eex(:,2),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= 0, ny=1  
		wind_y = ysl_v(:,7)*0.5*hx;
		f=f + sparse(1:nel,eex(:,3), wind_y,nel,nel);
        f=f + sparse(1:nel,1:nel,   -wind_y,nel,nel);
		a=a + sparse(1:nel,eex(:,3),-onecol,nel,nel);
        a=a + sparse(1:nel,1:nel,    onecol,nel,nel);
%
%% nx= -1, ny=0  
		wind_x = -xsl_v(:,8)*0.5*hy;
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
   n_null = 3*np-2;
   %%% fix hydrostatic pressure
   %fprintf('fixed hydrostatic pressure\n')
   %null_col=sparse(np,1); null_row=sparse(1,np);
   %f(:,np)=null_col;  f(np,:)=null_row;   f(np,np)=1;  
   %a(:,np)=null_col;  a(np,:)=null_row;   a(np,np)=1;   
end
%%
%% create vector version of discrete operators
npp=3*np; ss=speye(np,np);
av=sparse(npp,npp);
av(1:3:npp,1:3:npp)=a;
av(2:3:npp,2:3:npp)=ss;
av(3:3:npp,3:3:npp)=ss;
fv=sparse(npp,npp);
fv(1:3:npp,1:3:npp)=f;
fv(2:3:npp,2:3:npp)=viscosity*ss;
fv(3:3:npp,3:3:npp)=viscosity*ss;
return
