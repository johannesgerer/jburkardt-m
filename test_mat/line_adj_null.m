function x = line_adj_null ( n )

%*****************************************************************************80
%
%% LINE_ADJ_NULL returns a null vector of the LINE_ADJ matrix.
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
%    Output, real X(N), a null vector
%
  if ( mod ( n, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_ADJ_NULL - Fatal error!\n' );
    fprintf ( 1, '  For N even, there is no null vector.\n' );
    error ( 'LINE_ADJ_NULL - Fatal error!' );
  end

  x(1:4:n) =  1.0;
  x(2:2:n) =  0.0;
  x(3:4:n) = -1.0;

  return
end
