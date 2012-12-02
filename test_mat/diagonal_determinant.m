function determ = diagonal_determinant ( n, x )

%*****************************************************************************80
%
%% DIAGONAL_DETERMINANT returns the determinant of a diagonal matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the diagonal entries of A.
%
%    Output, real DETERM, the determinant.
%
  determ = prod ( x(1:n) );

  return
end
