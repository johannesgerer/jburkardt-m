function determ = line_adj_determinant ( n )

%*****************************************************************************80
%
%% LINE_ADJ_DETERM returns the determinant of the LINE_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
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
       if ( mod ( n, 4 ) == 1 )
    determ =   0.0;
  elseif ( mod ( n, 4 ) == 2 )
    determ = - 1.0;
  elseif ( mod ( n, 4 ) == 3 )
    determ =   0.0;
  elseif ( mod ( n, 4 ) == 0 )
    determ = + 1.0;
  end

  return
end
