function determ = herndon_determinant ( n )

%*****************************************************************************80
%
%% HERNDON_DETERMINANT returns the determinant of the Herndon matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2007
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
  determ = 6.0 / ( ( n + 1 ) * n * ( 5 - 2 * n ) );

  return
end
