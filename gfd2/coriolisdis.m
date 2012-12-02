%  Discussion:
%
%    This script calls NUMCORIO with various sets of parameters.
%
%    This script is discussed in chapter 2 of the reference.
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

% Coriolis
lat=30;
f=2*2*pi/(24*3600)*cos(pi/180*(lat));
%
% Simulation time
%
TP=2*pi/f;

%time step
%dt=TP/150;
fdt=0.05;
dt=fdt/f;
dtsol=1*dt;

% Intitial stuff
t0=0;
tf=10*TP;
u0=0;
v0=1;
%
% Explicit
%
alpha=0.;
[ue,ve,te]=numcorio(f,dt,alpha,t0,tf,u0,v0,dtsol);
%
% Implicit
%
alpha=1.;
[ui,vi,ti]=numcorio(f,dt,alpha,t0,tf,u0,v0,dtsol);
%
% Trapezoidal
%
alpha=0.5;
[ut,vt,tt]=numcorio(f,dt,alpha,t0,tf,u0,v0,dtsol);

% PLOT

plot(ue,ve,':',ui,vi,'.',ut,vt,'-')
axis([-3 3 -3 3])
axis('equal')
axis([-2 2 -2 2])
legend('\alpha = 0','\alpha = 1','\alpha = 0/2');
xlabel('u');
ylabel('v');
