function x = equidistant1 ( n )

%*****************************************************************************80
%
%% EQUIDISTANT1 returns the Type 1 Equidistant points.
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
  x(1:n) = ( 1 - n : 2 : n - 1 ) / ( n + 1 );

  return
end
