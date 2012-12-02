%% FRONTOGENESIS tracks groups of fluid parcels in a flow field.
%
%  Discussion:
%
%    This script is discussed in chapter 15 of the reference.
%
%  Modified:
%
%    02 December 2009
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

IM=30;
JM=30;
NMAX=10;  % or 2 or 150
PS=2;
t=0;
DX=1/(IM-1);
DY=1/(JM-1);
DT=1.5/(NMAX);
np=IM*JM;
x=zeros(np);
y=zeros(np);
fig=figure;

for i=1:IM
    for j=1:JM
        xx=2*(i-1)/(IM-1)-1;
        yy=2*(j-1)/(JM-1)-1;
        xp(i,j)=xx;
        yp(i,j)=yy;
        psi(i,j)=xx*yy;
    end
end

for i=1:100
    x(i)=-0.05+0.1*(i-1)/99.;
    y(i)=0.95;
end
for i=1:100
    x(i+100)=0.05;
    y(i+100)=0.95-0.2*(i-1)/99.;
end
for i=1:100
    x(i+200)=0.05-0.1*(i-1)/99.;
    y(i+200)=0.75;
end
for i=1:100
    x(i+300)=-0.05;
    y(i+300)=0.75+0.2*(i-1)/99.;
end
xi=x;
yi=y;

% RESOLUTION & PLOT

for n=1:NMAX+1
    for i=1:np
        [u,v]=velocityfronto(x(i),y(i));
        % predictor
        xx=x(i)+u*DT;
        yy=y(i)+v*DT;
        % corrector
        [u,v]=velocityfronto(xx,yy);
        x(i)=x(i)+u*DT;
        y(i)=y(i)+v*DT;
    end
    t=t+DT;
    plot(x,y,'.');
    axis equal;
    hold on;
    contour(xp',yp',psi')
    hold off;
    pause(0.01);
end

plot(x,y,'.');
axis equal;
hold on;
contour(xp',yp',psi');
hold off;
