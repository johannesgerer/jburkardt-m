function determ = vand2_determinant ( n, x )

%*****************************************************************************80
%
%% VAND2_DETERMINANT returns the determinant of the Vandermonde2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix desired.
%
%    Input, real X(N), the values that define A.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  for i = 1 : n
    for j = 1 : i - 1
      determ = determ * ( x(i) - x(j) );
    end
  end

  return
end
