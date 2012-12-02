function [total, uxref, yref] = flowvolume(qmethod,xy,xst,xref,fig)
%flowvolume   plots/explores flow solution on vertical cross-section 
%   [total, uxref, yref] = flowvolume(qmethod,xy,xst,xref,fig);
%   input
%          qmethod    mixed method 
%          xy         velocity nodal coordinate vector 
%          xst        flow solution vector
%          xref       x-location of grid line  
%          fig        figure number
%
%   IFISS function: DJS; 7 March 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
nvtx=length(xy(:,1));
ux=xst(1:nvtx); uy=xst(nvtx+1:2*nvtx);
kk=find(xy(:,1)==xref);
if isempty(kk), error('location xref is not a grid-line!'), end
uxref=ux(kk)'; uyref=uy(kk)'; yref=xy(kk,2);
figure(fig)
plot(yref,uxref,'-k'), axis('square'), title('x-section of flow')
%%
%% compute volume of flow using appropriate quadrature
nny=length(yref); hy=yref(2)-yref(1);
if qmethod >1,
%% Simpson's rule
ww=ones(nny,1); ww(2:2:nny-1)=4; ww(3:2:nny-1)=2;
total=(hy/3)*sum(ww.*uxref');
else 
%% Trapezium rule
ww=ones(nny,1); ww(2:2:nny-1)=2; ww(3:2:nny-1)=2;
total=(hy/2)*sum(ww.*uxref');
end
fprintf('\nvolume of flow is %10.6e \n',total)
return
