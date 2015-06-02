function [ f, g, h ] = rhs_stokes3 ( n, x, y )

%*****************************************************************************80
%
%% RHS_STOKES3 returns the right hand sides of the exact Stokes solution #3.
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
%    Output, real F(N), G(N), H(N), the right hand sides in the U,
%    V and P equations.
%
  f = zeros ( n, 1 );
  g = zeros ( n, 1 );
  h = zeros ( n, 1 );

  return
end
