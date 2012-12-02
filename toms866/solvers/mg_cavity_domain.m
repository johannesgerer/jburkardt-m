function [x,y,xy,mv,mp,bound] = mg_cavity_domain(nc,grid_type)
%mg_cavity_domain   square cavity Q2 grid generator for GMG
%   [x,y,xy,mv,mp,bound] = mg_cavity_domain(nc,grid_type)
%   input
%          nc           grid level indicator
%          grid_type    1 for uniform, 2 for stretched
%   output
%          grid-defining data
%
%   IFISS function: HCE; 24 January 2004.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage

%   modelled after IFISS function cavity_domain, adapted for GMG
n=2^nc; np=n/2; nq=n/4;
% y-direction
if grid_type==2
   hmax=nc/(2^(nc+1));
   x1=-1;x2=-2*hmax;x3=2*hmax;x4=1;nx1=2^(nc-1)-1;nx2=2;nx3=2^(nc-1)-1;
   y1=-1;y2=-2*hmax;y3=2*hmax;y4=1;ny1=2^(nc-1)-1;ny2=2;ny3=2^(nc-1)-1;
   y=subint(y1,y2,y3,y4,ny1,ny2,ny3);
   stretch=(y(3)-y(2))/(y(2)-y(1));
   x=y;
else
   yy=[1/np:1/np:1];
   ypos=[0,yy];
   yneg=-yy(length(yy):-1:1);
   y=[yneg,ypos]';
   x=y; 
end
%
%% compute biquadratic element coordinates
nvtx=(n+1)*(n+1);
[X,Y]=meshgrid(x,y);
xx=reshape(X',nvtx,1);
yy=reshape(Y',nvtx,1);
xy=[xx(:),yy(:)];
%
kx = 1;
ky = 1;
mel=0;
for j=1:np
   for i=1:np
      mref=(n+1)*(ky-1)+kx;
      pref=(np+1)*(j-1)+i;
      mel=mel+1;
      nvv(1) = mref;
      nvv(2) = mref+2;
      nvv(3) = mref+2*n+4;
      nvv(4) = mref+2*n+2;
      nvv(5) = mref+1;
      nvv(6) = mref+n+3; 
      nvv(7) = mref+2*n+3; 
      nvv(8)=  mref+n+1;
      nvv(9)=  mref+n+2; 
      npp(1) = pref;
      npp(2) = pref+1;
      npp(3) = pref+np+2;
      npp(4) = pref+np+1;
      mv(mel,1:9)=nvv(1:9);
      mp(mel,1:4)=npp(1:4);
      kx = kx + 2;
   end
   ky = ky + 2; 
   kx = 1;
end

%% compute boundary vertices and edges
% four boundary edges 
k1=find( xy(:,2)==-1  );
e1=[]; for k=1:mel, if any(mv(k,5)==k1), e1=[e1,k]; end, end
ef1=ones(size(e1));
%
k2=find( xy(:,1)==1 & xy(:,2)<1   & xy(:,2) >-1);
e2=[]; for k=1:mel, if any(mv(k,6)==k2), e2=[e2,k]; end, end
ef2=2*ones(size(e2));
%
k3=find( xy(:,2)==1  );
e3=[]; for k=1:mel, if any(mv(k,7)==k3), e3=[e3,k]; end, end
ef3=3*ones(size(e3));
%
k4=find( xy(:,1)==-1 & xy(:,2)<1   & xy(:,2) >-1);
e4=[]; for k=1:mel, if any(mv(k,8)==k4), e4=[e4,k]; end, end
ef4=4*ones(size(e4));
%
bound=sort([k1;k2;k3;k4]);
mbound=[e1',ef1';e2',ef2';e3',ef3';e4',ef4'];
