function [uxref, xref] = xsection(qmethod,xy,x_gal,yref,fig)
%xsection   plots/explores solution on horizontal cross-section 
%   [uxref, xref] = xsection(qmethod,xy,x_gal,yref,fig);
%   input
%          qmethod    mixed method 
%          xy         velocity nodal coordinate vector 
%          x_gal   solution vector
%          yref       y-location of grid line  
%          fig         figure number
%
%   IFISS function: DJS; 19 September 2005.
% Copyright (c) 2005 D.J. Silvester, H.C. Elman, A. Ramage 
nvtx=length(xy(:,1));
kk=find(xy(:,2)==yref);
if isempty(kk), error('location yref is not a grid-line!'), end
uxref=x_gal(kk);  xref=xy(kk,1);
figure(fig)
plot(xref,uxref,'-k'), axis('square'), title('x-section of flow')
%%
%% compute volume of flow using appropriate quadrature
nny=length(xref); hy=xref(2)-xref(1);
if qmethod >1,
%% Simpson's rule
ww=ones(nny,1); ww(2:2:nny-1)=4; ww(3:2:nny-1)=2;
total=(hy/3)*sum(ww.*uxref);
else 
%% Trapezium rule
ww=ones(nny,1); ww(2:2:nny-1)=2; ww(3:2:nny-1)=2;
total=(hy/2)*sum(ww.*uxref);
end
fprintf('\narea of x-section is %10.6e \n',total)
return
