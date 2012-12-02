function fx = camel ( n, x )

%*****************************************************************************80
%
%% CAMEL evaluates the six-hump camel back function.
%
%  Discussion:
%
%    This function has been modified from its original definition by
%    multiplying by -1 and then adding 1, so that there is a small island
%    of positivity within the box [-2.5,2.5]x[-2.5,2.5].
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
%    Input, real X(N,2), the point coordinates.
%
%    Output, real FX(N), the function values.
%
  fx = zeros ( n, 1 );

  fx = - ...
  ( ...
      ( 4 - 2.1 * x(:,1).^2 + 0.33 * x(:,1).^4 ) .* x(:,1).^2 ...
    + x(:,1) .* x(:,2) + 4 * ( x(:,2).^2 - 1 ) .* x(:,2).^2 ...
  ) + ones ( n, 1 );

  return
end
