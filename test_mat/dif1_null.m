function x = dif1_null ( n )

%*****************************************************************************80
%
%% DIF1_NULL returns a null vector of the first difference matrix.
%
%  Discussion:
%
%    N must not be even.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real X(N), the null vector.
%
  if ( mod ( n, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF1_NULL - Fatal error!\n' );
    fprintf ( 1, '  The matrix is not singular for even N.\n' );
    error ( 'DIF1_NULL - Fatal error!' );
  end

  x(1:2:n) = 1.0;
  x(2:2:n-1) = 0.0;

  return
end
