%% ADVDIFFSOURCE solves the advection-diffusion equation with sources.
%
%  Discussion:
%
%    This script combines the Lax-Wendroff advection scheme with the explicit
%    Euler diffusion scheme and an explicit scheme for the sink term with
%    rate K.
%
%    This script is discussed in chapter 6 of the reference.
%
%  Modified:
%
%    01 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
clear all;

% PARAMETERS

M=100;
cfl=0.5;     % Test with cfl= 1 0.5 0.1 0.05
diffd=0.25;  % Test with diffd= 0.05
gammadt=.05;
MF=100;
NITER=MF/cfl;
MSOL=2;
isol=1;

% RESOLUTION

% Initial values
cc=zeros(M,NITER/MSOL);
for i=1:M
    c(i)=0;
    x(i)=i;
end
cp=c;

% Make N time steps
for n=1:NITER
    
    % New values for interior points
    for i=2:M-1
        cp(i)=c(i)-cfl*(c(i+1)-c(i-1))/2-gammadt*c(i)+(diffd+cfl*cfl/2)*(c(i+1)-2*c(i)+c(i-1));
    end
    
    % Boundary condition (Upwind)
    cp(1)=1.;
    cp(M)=1.;
    
    % Update new values
    c=cp;
    if mod(n,MSOL)==0
        isol=isol+1;
        cc(:,isol)=c(:);
        
% PLOT
        
        plot(x,c)
        xlabel('x');
        ylabel('C');
        title(n/NITER)
        pause(0.1)
    end
    
end

%mesh(cc)
%xlabel('x');
%ylabel('iteration');
%zlabel('C');

%plot(x,cc,'-')%,x,ci,'-.')
%axis([0 M -0.4 1.4])
