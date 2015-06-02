function [ f, g, h ] = rhs_taylor ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% RHS_TAYLOR returns right hand sides of the Taylor vortex equations.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/rhs_taylor.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Geoffrey Taylor,
%    On the decay of vortices in a viscous fluid,
%    Philosophical Magazine,
%    Volume 46, 1923, pages 671-674.
%
%    Geoffrey Taylor, A E Green,
%    Mechanism for the production of small eddies from large ones,
%    Proceedings of the Royal Society of London, 
%    Series A, Volume 158, 1937, pages 499-521.
%
%  Parameters:
%
%    Input, real NU, the kinematic viscosity.
%
%    Input, real RHO, the density.
%
%    Input, integer N, the number of points at which the solution is to
%    be evaluated.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Input, real T or T(N), the time coordinate or coordinates.
%
%    Output, real F(N), G(N), H(N), the right hand sides in the U, V and P 
%    equations.
%
  [ r, c ] = size ( x );

  f = zeros ( r, c );
  g = zeros ( r, c );
  h = zeros ( r, c );

  return
end

