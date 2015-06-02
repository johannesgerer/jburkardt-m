function x = chebyshev1 ( n )

%*****************************************************************************80
%
%% CHEBYSHEV1 returns the Type 1 Chebyshev points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2018
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the points.
%
  x(1:n) = cos ( ( 2.0 * (0:n-1) + 1.0 ) * pi / 2 / n );

  return
end
