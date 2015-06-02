function x = fejer1 ( n )

%*****************************************************************************80
%
%% FEJER1 returns the Type 1 Fejer points.
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
  theta(1:n) = ( 2*n-1 : -2 : 1 ) * pi / ( 2 * n );
  x(1:n) = cos ( theta(1:n) );

  return
end
