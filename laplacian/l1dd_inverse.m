function l = l1dd_inverse ( n, h )

%*****************************************************************************80
%
%% L1DD_INVERSE stores the inverse of the 1D DD Laplacian.
%
%  Discussion:
%
%    The N grid points are assumed to be evenly spaced by H.
%
%    For N = 5, the discrete Laplacian with Dirichlet boundary conditions
%    at both ends of [0,6] has the matrix form L:
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
%    29 October 2013
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
%    Output, real L(N,N), the inverse of the Laplacian matrix.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'L1DD_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1DD_INVERSE - Fatal error!' );
  end

  l = zeros ( n, n );

  for j = 1 : n
    for i = 1 : n
      l(i,j) = min ( i, j ) * ( n + 1 - max ( i, j ) ) * h * h / ( n + 1 );
    end
  end

  return
end