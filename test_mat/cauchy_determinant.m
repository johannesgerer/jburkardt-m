function determ = cauchy_determinant ( n, x, y )

%*****************************************************************************80
%
%% CAUCHY_DETERMINANT returns the determinant of the CAUCHY matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), Y(N), vectors that determine A.
%
%    Output, real DETERM, the determinant.
%
  top = 1.0;
  for i = 1 : n
    for j = i + 1 : n
      top = top * ( x(j) - x(i) ) * ( y(j) - y(i) );
    end
  end

  bottom = 1.0;
  for i = 1 : n
    for j = 1 : n
      bottom = bottom * ( x(i) + y(j) );
    end
  end

  determ = top / bottom;

  return
end
