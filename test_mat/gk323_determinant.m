function determ = gk323_determinant ( n )

%*****************************************************************************80
%
%% GK323_DETERMINANT returns the determinant of GK323.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   09 October 2007
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
  determ = ( -1 )^( n - 1 ) * 2^( n - 2 ) * ( n - 1 );

  return
end
