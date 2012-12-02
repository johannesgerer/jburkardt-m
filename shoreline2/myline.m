function fx = myline ( n, x )

%*****************************************************************************80
%
%% MYLINE evaluates the line function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(2,N), the point coordinates.
%
%    Output, real FX(1,N), the function values.
%
  fx = zeros ( 1, n );

  fx = x(1,:) - 3.0 * x(2,:) - 2.1;

  return
end
