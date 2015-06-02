function [ u, v, p ] = uvp_taylor ( nu, rho, n, x, y, t )

%*****************************************************************************80
%
%% UVP_TAYLOR evaluates the Taylor exact Navier Stokes solution.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/uvp_taylor.m
%
%  Discussion:
%
%    This flow is known as a Taylor-Green vortex.
%
%    The given velocity and pressure fields are exact solutions for the 2D 
%    incompressible time-dependent Navier Stokes equations over any region.
%
%    To define a typical problem, one chooses a bounded spatial region 
%    and a starting time, and then imposes boundary and initial conditions
%    by referencing the exact solution appropriately.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2015
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
%    Output, real U(N), V(N), P(N), the velocity components and
%    pressure at each of the points.
%
  cx = cos ( pi * x );
  cy = cos ( pi * y );
  c2x = cos ( 2.0 * pi * x );
  c2y = cos ( 2.0 * pi * y );
  sx = sin ( pi * x );
  sy = sin ( pi * y );
  e2t = exp ( - 2.0 * pi * pi * nu * t );
  e4t = exp ( - 4.0 * pi * pi * nu * t );

  u = - cx .* sy .* e2t;
  v =   sx .* cy .* e2t;
  p = - 0.25 * rho * ( c2x + c2y ) * e4t;

  return
end

