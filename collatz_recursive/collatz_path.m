function collatz_path ( n )

%*****************************************************************************80
%
%% COLLATZ_PATH uses recursion to print the path of a Collatz sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the current member of the path.
%
  fprintf ( 1, '  %d\n', n );

  if ( n < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'COLLATZ_PATH - Fatal error!\n' );
    fprintf ( 1, '  Path member N = %d is not positive.\n', n );
    error ( 'COLLATZ_PATH - Fatal error!' );

  elseif ( n == 1 )

  elseif ( mod ( n, 2 ) == 0 )
    collatz_path ( floor ( n / 2 ) );
  else
    collatz_path ( 3 * n + 1 );
  end

  return
end
