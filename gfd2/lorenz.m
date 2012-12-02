function [ f ] = lorenz ( x, par )

%*****************************************************************************80
%
%% LORENZ evaluates the right hand side of the Lorenz ODE system.
%
%  Discussion:
%
%    This function is discussed in chapter 22 of the reference.
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
%    Input, real X(3), the current state vector.
%
%    Input, real PAR(3), the parameters SIGMA, R, and B.
%
%    Output, real F(3), the right hand side of the ODE.
%
  f(1) = par(1) * ( x(2) - x(1) );
  f(2) = par(2) * x(1) - x(2) - x(1) * x(3);
  f(3) = x(1) * x(2) - par(3) * x(3);

  return
end
