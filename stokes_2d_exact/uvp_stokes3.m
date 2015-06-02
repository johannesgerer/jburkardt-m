function [ u, v, p ] = uvp_stokes3 (  n, x, y )

%*****************************************************************************80
%
%% UVP_STOKES3 evaluates the exact Stokes solution #3.
%
%  Discussion:
%
%    The solution is defined over the unit square [-1,+1]x[-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Elman, Alison Ramage, David Silvester,
%    Finite Elements and Fast Iterative Solvers with
%    Applications in Incompressible Fluid Dynamics,
%    Oxford, 2005,
%    ISBN: 978-0198528678,
%    LC: QA911.E39.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the coordinates of the points.
%
%    Output, real U(N), V(N), P(N), the velocity components and
%    pressure at each of the points.
%
  x = x(:);
  y = y(:);

  u(1:n,1) =   20.0 * x(1:n,1) .* y(1:n,1) .^ 3;
  v(1:n,1) =    5.0 * ( x(1:n,1) .^ 4  - y(1:n,1) .^ 4 );
  p(1:n,1) =   60.0 * x(1:n,1) .^ 2 .* y(1:n,1) - 2.0 * y(1:n,1) .^ 3 + 10.0;

  return
end
