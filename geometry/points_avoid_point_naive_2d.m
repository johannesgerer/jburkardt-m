function value = points_avoid_point_naive_2d ( n, p_set, p )

%*****************************************************************************80
%
%% POINTS_AVOID_POINT_NAIVE_2D: is a point "far" from a set of points in 2D?
%
%  Discussion:
%
%    The routine discards points that are too close to other points.
%    The method used to check this is quadratic in the number of points,
%    and may take an inordinate amount of time if there are a large
%    number of points.  But in that case, what do you want?  If you want
%    lots of points, you don't want to delete any because it won't matter.
%
%    The test point is "far enough" from an accepted point if
%    the Euclidean distance is at least 100 times EPSILON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of accepted points.
%
%    Input, real P_SET(2,N), the accepted points.
%
%    Input, real P(2), a point to be tested.
%
%    Output, logical VALUE, is TRUE if XY_TEST is
%    "far enough" from all the accepted points.
%
  dim_num = 2;

  tol = 100.0 * eps;

  value = 1;

  for j = 1 : n

    if ( sqrt ( sum ( ( p_set(1:dim_num,j) - p(1:dim_num) ).^2 ) ) < tol )
      value = 0;
      return
    end

  end

  return
end
