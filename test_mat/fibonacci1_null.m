function x = fibonacci1_null ( n, f1, f2 )

%*****************************************************************************80
%
%% FIBONACCI1_NULL returns a null vector of the FIBONACCI1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real F1, F2, the first two elements of the sequence
%    that will generate the Fibonacci sequence.
%
%    Output, real X(N), a null vector.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FIBONACCI1_NULL - Fatal error!\n' );
    fprintf ( 1, '  3 <= N is required.\n' );
    error ( 'FIBONACCI1_NULL - Fatal error!' );
  end

  x(1:n-3)   =  0.0;
  x(n-2:n-1) = -1.0;
  x(n)       = +1.0;

  return
end
