function a = dif1_inverse ( n )

%*****************************************************************************80
%
%% DIF1_INVERSE returns the inverse of the DIF1 matrix.
%
%  Discussion:
%
%    The inverse only exists when N is even.
%
%  Example:
%
%    N = 8
%
%    0 -1  0 -1  0 -1  0 -1
%    1  0  0  0  0  0  0  0
%    0  0  0 -1  0 -1  0 -1
%    1  0  1  0  0  0  0  0
%    0  0  0  0  0 -1  0 -1
%    1  0  1  0  1  0  0  0
%    0  0  0  0  0  0  0 -1
%    1  0  1  0  1  0  1  0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF1_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  Inverse only exists for N even.\n' );
    error ( 'DIF1_INVERSE - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : 2 : n - 1
    for j = i + 1 : 2 : n
      a(i,j) = -1.0;
    end
  end

  for i = 2 : 2 : n
    for j = 1 : 2 : i - 1
      a(i,j) = 1.0;
    end
  end

  return
end
