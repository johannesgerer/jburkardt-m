function determ = gk324_determinant ( n, x )

%*****************************************************************************80
%
%% GK324_DETERMINANT returns the determinant of the GK324 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N-1), the first N-1 entries of the
%    last row.
%
%    Output, real DETERM, the determinant.
%
  determ = prod ( 1.0 - x(1:n-1) );

  return
end
