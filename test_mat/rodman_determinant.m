function value = rodman_determinant ( n, alpha )

%*****************************************************************************80
%
%% RODMAN_DETERMINANT returns the determinant of the RODMAN matrix.
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
%    Input, real ALPHA, the parameter.
%
%    Output, real VALUE, the determinant.
%
  value = ( 1.0 - alpha )^( n - 1 ) * ( 1.0 + alpha * ( n - 1 ) );

  return
end
