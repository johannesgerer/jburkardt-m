function x = chebyshev4 ( n )

%*****************************************************************************80
%
%% CHEBYSHEV4 returns the Type 4 Chebyshev points.
%
%  Discussion:
%
%    Note that this point set is NOT symmetric in [-1,+1].
%    It is sometimes augmented by the value +1.
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
  angle(1:n) = 2 * ( n - (1:n) + 1 ) * pi / ( 2 * n + 1 );
  x(1:n) = cos ( angle );

  return
end

