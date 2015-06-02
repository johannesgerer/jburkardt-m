function x = fibonacci1_null_right ( m, n, f1, f2 )

%*****************************************************************************80
%
%% FIBONACCI1_NULL_RIGHT returns a right null vector of the FIBONACCI1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, real F1, F2, the first two elements of the sequence
%    that will generate the Fibonacci sequence.
%
%    Output, real X(N,1), a null vector.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FIBONACCI1_NULL_RIGHT - Fatal error!\n' );
    fprintf ( 1, '  3 <= N is required.\n' );
    error ( 'FIBONACCI1_NULL_RIGHT - Fatal error!' );
  end

  x = zeros ( n, 1 );

  x(n-2:n-1,1) = -1.0;
  x(n,1)       = +1.0;

  return
end
