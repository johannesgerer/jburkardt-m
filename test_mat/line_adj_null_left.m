function x = line_adj_null_left ( m, n )

%*****************************************************************************80
%
%% LINE_ADJ_NULL_LEFT returns a left null vector of the LINE_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Output, real X(M), a null vector
%
  if ( mod ( m, 2 ) == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LINE_ADJ_NULL_LEFT - Fatal error!\n' );
    fprintf ( 1, '  For M even, there is no null vector.\n' );
    error ( 'LINE_ADJ_NULL_LEFT - Fatal error!' );
  end

  x = zeros ( m, 1 );

  x(1:4:m,1) =  1.0;
  x(3:4:m,1) = -1.0;

  return
end
