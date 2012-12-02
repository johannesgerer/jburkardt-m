%% SUMATRA sets up a 1D topography.
%
%  Discussion:
%
%    This script is discussed in chapter 9 of the reference.
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
  close all;

  M=800;
  LX=2000000;
  DX=LX/M;
  L=LX*0.8;
  W=LX/20;

  for i=1:M
    x(i)=(i-1/2)*DX;
    depth(i)=2000*(1-0.8*tanh((x(i)-L)/W));
  end
%
%  Plot the depth as a function of X.
%
  plot ( x, depth )
  xlabel ( 'X' )
  ylabel ( 'Depth' )
  title ( 'Sumatra' )

   
