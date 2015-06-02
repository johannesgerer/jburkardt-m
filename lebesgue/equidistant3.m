function x = equidistant3 ( n )

%*****************************************************************************80
%
%% EQUIDISTANT3 returns the Type 3 Equidistant points.
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
  x(1:n) = ( 1 - n : 2 : n - 1 ) / n;

  return
end
