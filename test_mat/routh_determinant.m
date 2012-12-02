function determ = routh_determinant ( n, x )

%*****************************************************************************80
%
%% ROUTH_DETERMINANT returns the determinant of the Routh matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the data that defines the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = prod ( x(n:-2:1) );

  return
end
