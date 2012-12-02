function [ u, v ] = velocitysver ( x, y ) 

%*****************************************************************************80
%
%% VELOCITYSVER computes the Sverdrup velocity field.
%
%  Discussion:
%
%    psi = cos(y*pi/2)*(1-x-exp(-x/del))
%
%    This function is discussed in chapter 12 of the reference.
%
%  Modified:
%
%    30 November 2009
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
%    Input, real X, Y, the evaluation point.
%
%    Output, real U, V, the velocity components at (X,Y).
%
  del = 0.1;

  u = pi/2 * sin(y*pi/2) * (1-x-exp(-x/del));
  v =        cos(y*pi/2) * (-1+1/del*exp(-x/del));

  return
end
