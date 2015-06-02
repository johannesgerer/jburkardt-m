function lu = l1dd_apply ( n, h, u )

%*****************************************************************************80
%
%% L1DD_APPLY applies the 1D DD Laplacian to a vector.
%
%  Discussion:
%
%    The N grid points are assumed to be evenly spaced by H.
%
%    For N = 5, the discrete Laplacian with Dirichlet boundary conditions
%    at both ends of [0,6] is applied to a vector of 7 values, with a spacing
%    of H = 6/(N+1) = 1 at the points X:
%
%      0  1  2  3  4  5  6
%
%    and has the matrix form L:
%
%       2 -1  0  0  0
%      -1  2 -1  0  0
%       0 -1  2 -1  0
%       0  0 -1  2 -1
%       0  0  0 -1  2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%    N must be at least 3.
%
%    Input, real H, the spacing between points.
%
%    Input, real U(N,1), the value at each point.
%
%    Output, real LU(N,1), the Laplacian evaluated at each point.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'L1DD_APPLY - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1DD_APPLY - Fatal error!' );
  end

  lu = zeros ( n, 1 );

  i = 1;
  lu(i) = ( 2.0 * u(i) - u(i+1) ) / h / h;
  for i = 2 : n - 1
    lu(i) = ( - u(i-1) + 2.0 * u(i) - u(i+1) ) / h / h;
  end
  i = n;
  lu(i) = ( - u(i-1) + 2.0 * u(i) ) / h / h;

  return
end