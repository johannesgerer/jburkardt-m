function determ = rodman_determinant ( alpha, n )

%*****************************************************************************80
%
%% RODMAN_DETERMINANT returns the determinant of the Rodman matrix.
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
%    Input, real ALPHA, the scalar that defines A.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  determ = ( 1.0 - alpha )^( n - 1 ) * ( 1.0 + alpha * ( n - 1 ) );

  return
end
