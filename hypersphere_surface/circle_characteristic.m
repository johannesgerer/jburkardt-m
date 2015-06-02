function y = circle_characteristic ( m, n, x )

%*****************************************************************************80
%
%% CIRCLE_CHARACTERISTIC evaluates the characteristic function of a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points to check.
%
%    Input, real X(M,N), the coordinates of points to be checked.
%
%    Output, real Y(N,1), is 1 if the point is inside, 0 otherwise.
%
  y = sqrt ( sum ( x.^2, 1 ) );

  y = y';

  y = ( y < 1.0 );

  return
end

