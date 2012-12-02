%% ADVLEAP solves the advection equation using the leapfrog scheme.
%
%  Discussion:
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
cfl=0.75;
MF=50;
i1=10;
i2=30;
N=MF/cfl;

% RESOLUTION

% Initial values
for i=1:M
    c(i)=0;
    x(i)=i;
    ce(i)=0;
end
for i=i1:i2
    c(i)=1;
    ce(i+MF)=1;
end
ci=c;
cm=c;
cp=c;

% First step
for i=2:M-1
    c(i)=cm(i)-cfl/2*(cm(i+1)-cm(i-1));  % (Euler step)
   % c(i)=0;
end

% Make N time steps
for n=1:N
    
    % New values for interior points
    for i=2:M-1
        cp(i)=cm(i)-cfl*(c(i+1)-c(i-1));
    end
    
    % Boundary condition (Upwind)
    cp(M)=c(M)-cfl*(c(M)-c(M-1));
    cp(1)=0.;
    
    % Boundary condition (Periodic)
    % cp(M)=cp(2);
    % cp(1)=cp(M-1);
    
    % Update new values
    for i=1:M
        cm(i)=c(i);
        c(i)=cp(i);
    end
    
    csquare(n)=0;
    for i=2:M-1
        csquare(n)=csquare(n)+c(i)*c(i);
    end
    
end

% PLOT

figure;
plot(csquare)
xlabel('iteration');
ylabel('csquare');

figure;
plot(x,c,'-',x,ce,'-.',x,ci,'--')
xlabel('x');
ylabel('C');
