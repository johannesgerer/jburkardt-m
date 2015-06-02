function x = chebyshev2 ( n )

%*****************************************************************************80
%
%% CHEBYSHEV2 returns the Type 2 Chebyshev points.
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
  if ( n == 1 )
    x(1) = 0.0;
  else
    x(1:n) = cos ( ( n - (1:n) ) * pi / ( n - 1 ) );
  end

  return
end
