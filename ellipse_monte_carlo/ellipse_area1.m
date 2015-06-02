function value = ellipse_area1 ( a, r )

%*****************************************************************************80
%
%% ELLIPSE_AREA1 returns the area of an ellipse defined by a matrix.
%
%  Discussion:
%
%    The points X in the ellipse are described by a 2 by 2
%    positive definite symmetric matrix A, and a "radius" R, such that
%      X' * A * X <= R * R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2,2), the matrix that describes
%    the ellipsoid.  A must be symmetric and positive definite.
%
%    Input, real R, the "radius" of the ellipse.
%
%    Output, real VALLUE, the area of the ellipse.
%
  value = r * r * pi / sqrt ( a(1,1) * a(2,2) - a(2,1) * a(1,2) );

  return
end
