function l = l1dn_inverse ( n, h )

%*****************************************************************************80
%
%% L1DN_INVERSE stores the inverse of the 1D DN Laplacian.
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
    fprintf ( 1, 'L1DN_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1DN_INVERSE - Fatal error!' );
  end

  l = zeros ( n, n );

  for j = 1 : n
    for i = 1 : n
      l(i,j) = min ( i, j ) * h * h;
    end
  end

  return
end
