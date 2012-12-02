%  Discussion:
%
%    FIRSTDIFFUSION.M applies a first order scheme (Euler's method)
%    to solve the diffusion equation.  This example illustrates the
%    fact that Euler's method is liable to numerical instability.
%
%    This script is discussed in chapter 5 of the reference.
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

% M nodes (first below interface, last above surface)
% (M-2)*DZ=H
M=100;
H=100;
kappa=0.01;
DZ=H/(M-2);
DT=H*H/kappa/M;
N=20;
t=0;
DS=-1;
%
% Initial field
%
for i=1:M;
    z(i)=-H+(i-1-1/2)*DZ;
    CN(i)=37+DS*cos(z(i)/H*pi);
end
%
% Make N time steps
%
for n=1:N
    
    % Boundary condition (zero gradient)
    CN(1)=CN(2);
    CN(M)=CN(M-1);
    plot(CN,z)
    xlabel('S');
    ylabel('z');
    pause(0.5)
    
    % New values for interior points
    for i=2:M-1
        CNP(i)=CN(i)+kappa*DT/DZ/DZ*(CN(i-1)-2*CN(i)+CN(i+1));
    end
    
    % Update new values and conservation
    SUM(n)=0;
    for i=2:M-1
        CN(i)=CNP(i);
        SUM(n)=SUM(n)+CN(i);
    end
    SUM(n)
    
    % Update time
    t=t+DT;
    
end
%
%  Plot the results.
%
plot(CN,z);
xlabel('S');
ylabel('z');

figure;
title('Conservation')
plot(SUM);
xlabel('iteration');
ylabel('SUM');
