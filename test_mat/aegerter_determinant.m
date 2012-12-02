function determ = aegerter_determinant ( n )

%*****************************************************************************80
%
%% AEGERTER_DETERMINANT returns the determinant of the AEGERTER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real DETERM, the determinant.
%
  determ = ( n - ( ( n - 1 ) * n * ( 2 * n - 1 ) ) / 6 );

  return
end
