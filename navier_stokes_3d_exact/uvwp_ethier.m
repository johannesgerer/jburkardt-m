function [ u, v, w, p ] = uvwp_ethier ( a, d, n, x, y, z, t )

%*****************************************************************************80
%
%% UVWP_ETHIER evaluates the Ethier exact Navier Stokes solution.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_3d_exact/uvwp_ethier.m
%
%  Discussion:
%
%    The reference asserts that the given velocity and pressure fields
%    are exact solutions for the 3D incompressible time-dependent
%    Navier Stokes equations over any region.
%
%    To define a typical problem, one chooses a bounded spatial region 
%    and a starting time, and then imposes boundary and initial conditions
%    by referencing the exact solution appropriately.
%
%    In the reference paper, a calculation is made for the cube centered
%    at (0,0,0) with a "radius" of 1 unit, and over the time interval
%    from t = 0 to t = 0.1, with parameters a = PI/4 and d = PI/2,
%    and with Dirichlet boundary conditions on all faces of the cube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    C Ross Ethier, David Steinman,
%    Exact fully 3D Navier-Stokes solutions for benchmarking,
%    International Journal for Numerical Methods in Fluids,
%    Volume 19, Number 5, March 1994, pages 369-375.
%
%  Parameters:
%
%    Input, real A, D, the parameters.  Sample values are A = PI/4 and
%    D = PI/2.
%
%    Input, integer N, the number of points at which the solution is to
%    be evaluated.
%
%    Input, real X(N), Y(N), Z(N), the coordinates of the points.
%
%    Input, real T or T(N), the time coordinate or coordinates.
%
%    Output, real U(N), V(N), W(N), P(N), the velocity components and
%    pressure at each of the points.
%
  ex = exp ( a * x );
  ey = exp ( a * y );
  ez = exp ( a * z );

  e2t = exp  ( - d * d * t );

  exy = exp ( a * ( x + y ) );
  eyz = exp ( a * ( y + z ) );
  ezx = exp ( a * ( z + x ) );

  sxy = sin ( a * x + d * y );
  syz = sin ( a * y + d * z );
  szx = sin ( a * z + d * x );

  cxy = cos ( a * x + d * y );
  cyz = cos ( a * y + d * z );
  czx = cos ( a * z + d * x );

  u = - a * ( ex .* syz + ez .* cxy ) .* e2t ;
  v = - a * ( ey .* szx + ex .* cyz ) .* e2t;
  w = - a * ( ez .* sxy + ey .* czx ) .* e2t;
  p = 0.5 * a * a * e2t .* e2t .* ( ...
    + ex .* ex + 2.0 * sxy .* czx .* eyz ...
    + ey .* ey + 2.0 * syz .* cxy .* ezx ...
    + ez .* ez + 2.0 * szx .* cyz .* exy );

  return
end

