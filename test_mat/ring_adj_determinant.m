function determ = ring_adj_determinant ( n )

%*****************************************************************************80
%
%% RING_ADJ_DETERMINANT returns the determinant of the RING_ADJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
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
  if ( n == 1 )
    determ = 1.0;
  elseif ( n == 2 )
    determ = -1.0;
  elseif ( mod ( n, 4 ) == 0 )
    determ = 0.0;
  elseif ( mod ( n, 4 ) == 1 )
    determ = 2.0;
  elseif ( mod ( n, 4 ) == 2 )
    determ = -4.0;
  elseif ( mod ( n, 4 ) == 3 )
    determ = 2.0;
  end

  return
end
