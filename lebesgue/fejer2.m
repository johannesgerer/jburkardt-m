function x = fejer2 ( n )

%*****************************************************************************80
%
%% FEJER2 returns the Type 2 Fejer points.
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
  theta(1:n) = ( n : -1 : 1 ) * pi / ( n + 1 );
  x(1:n) = cos ( theta(1:n) );

  return
end

