function centroid_index = points_centroid_2d ( n, p )

%*****************************************************************************80
%
%% POINTS_CENTROID_2D computes the discrete centroid of a point set in 2D.
%
%  Discussion:
%
%    Given a discrete set of points S, the discrete centroid z is defined by
%
%                           sum ( x in S ) ( x - z )**2
%        = min ( y in S ) { sum ( x in S ) ( x - y )**2
%
%    In other words, the discrete centroid is a point in the set whose distance
%    to the other points is minimized.  The discrete centroid of a point set
%    need not be unique.  Consider a point set that comprises the
%    vertices of an equilateral triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real P(2,N), the points.
%
%    Output, integer CENTROID_INDEX, the index of a discrete centroid 
%    of the set, between 1 and N.
%
  dim_num = 2;

  dist_min = 0.0;
  centroid_index = -1;

  for i = 1 : n

    dist = 0.0;
    for j = 1 : n
      dist = dist + sum ( ( p(1:dim_num,i) - p(1:dim_num,j) ).^2 );
    end

    if ( i == 1 )
      dist_min = dist;
      centroid_index = i;
    elseif ( dist < dist_min )
      dist_min = dist;
      centroid_index = i;
    end

  end

  return
end
