function y = cube_characteristic ( m, n, x )

%*****************************************************************************80
%
%% CUBE_CHARACTERISTIC evaluates the characteristic function of a cube.
%
%  Discussion:
%
%    The dimension of the cube is arbitrary, and set by the input value M.
%
%    The cube is assumed to have "center" at the origin and radius 1,
%    with sides aligned with the coordinate axes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
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
  y = max ( abs ( x ) );

  y = ( y < 1.0 )';

  return
end

