%% TVDADV1D uses a total variance diminishing procedure for 1D advection.
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

  M=100;
  cfl=0.5;
  MF=50;
  i1=10;
  i2=30;
  NITER=MF/cfl;

  for i=1:M
    c(i)=0;
    x(i)=i;
    ce(i)=0;
    flux(i)=0;
    rr(i)=0;
    phi(i)=0;
    dx(i)=1;
    dt=0.5;
    u(i)=1;
  end

  for i=i1:i2
    c(i)=1;
  end
%
%  The ideal final solution.
%
  for i=1:M-MF
    ce(i+MF)=c(i);
  end

  ci=c;
  cp=c;

  t=0;
  for n=1:NITER
    cp=adv1D(u,c,dt,dx,M);
    t=t+dt;
    for i=1:M
      c(i)=cp(i);
    end
    c(1)=c(2);
    c(M)=c(M-1);
    plot ( x, c,  '-', ...
           x, ce, '-.', ...
           x, ci, '--' );
    axis([0 100 -0.4 1.4]);
    pause(0.1);
  end
