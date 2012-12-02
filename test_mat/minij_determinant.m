function determ = minij_determinant ( n )

%*****************************************************************************80
%
%% MINIJ_DETERMINANT returns the determinant of the MINIJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 2 * n + 1 );
    determ = determ * 0.5 / ( 1.0 - cos ( angle ) );
  end

  return
end
