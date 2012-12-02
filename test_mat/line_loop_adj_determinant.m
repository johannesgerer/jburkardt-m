function determ = line_loop_adj_determinant ( n )

%*****************************************************************************80
%
%% LINE_LOOP_ADJ_DETERMINANT returns the determinant of the LINE_LOOP_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) == 1 )

    determ = 0.0;

  else

    determ = 1.0;

    for i = 1 : n
      angle = i * pi / ( n + 1 );
      determ = determ * ( 1.0 + 2.0 * cos ( angle ) );
    end

  end

  return
end
