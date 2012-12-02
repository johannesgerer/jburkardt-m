%  Discussion:
%
%    This script calls CORIOLISANIM with "reasonable" parameters.
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
%    N, the number of time steps for a full period.
%
%    NEND, the last time step.
%
%    ALPHA, the scaled azimuthal initial velocity V_0/(X_0 Omega).
%
%    BETA, the scaled radial initial velocity U_0/(X_0 Omega).
%
%    X0, the initial distance (less then 10 for plotting reasons).
%
clear all;

alpha=1.2;
beta=0.9;
X0=3;
n=101;
nend=n/1+1;

% PLOT

for nn = 1 : 1
  p1 = coriolisanim(n,nend,alpha,beta,X0);
end
