function e1 = l1_error ( n, x, u, exact )

%*****************************************************************************80
%
%% COMPUTE_L1_ERROR estimates the l1 error norm of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over an interval [A,B]
%    involving N nodes.
%
%    The coefficients U(1:N) have been computed, and a formula for the
%    exact solution is known.
%
%    This function estimates the little l1 norm of the error:
%      L1_NORM = sum ( 1 <= I <= N ) abs ( U(i) - EXACT(X(i)) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of nodes.
%
%    Input, real X(N), the mesh points.
%
%    Input, real U(N), the finite element coefficients.
%
%    Input, function EQ = EXACT ( X ), returns the value of the exact
%    solution at the point X.
%
%    Output, real E1, the little l1 norm of the error.
%

%
%  Destroy all row vectors.
%  I am so sick of them!
%
  u = u(:);
  x = x(:);

  e1 = sum ( abs ( u(1:n) - exact ( x(1:n) ) ) );

  e1 = e1 / n;

  return
end
