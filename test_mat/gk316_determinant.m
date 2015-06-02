function value = gk316_determinant ( n )

%*****************************************************************************80
%
%% GK316_DETERMINANT returns the determinant of the GK316 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the determinant..
%
  value = - ( n * ( n + 1 ) * ( 2 * n - 5 ) ) / 6.0;

  return
end
