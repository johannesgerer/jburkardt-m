function value = gfpp_determinant ( n, alpha )

%*****************************************************************************80
%
%% GFPP_DETERMINANT returns the determinant of the GFPP matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, determines subdiagonal elements.
%
%    Output, real VALUE, the determinant.
%
  value = ( 1.0 + abs ( alpha ) ) ^ ( n - 1 );

  return
end
