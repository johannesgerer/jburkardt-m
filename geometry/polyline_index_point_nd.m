function pt = polyline_index_point_nd ( dim_num, nk, pk, t )

%*****************************************************************************80
%
%% POLYLINE_INDEX_POINT_ND evaluates a polyline at a given arclength in ND.
%
%  Discussion:
%
%    The polyline is defined as the set of NK-1 line segments lying
%    between a sequence of NK points.  The arclength of a point lying
%    on the polyline is simply the length of the broken line from the
%    initial point.  Any point on the polyline can be found by
%    specifying its arclength.
%
%    If the given arclength coordinate is less than 0, or greater
%    than the arclength coordinate of the last given point, then
%    extrapolation is used, that is, the first and last line segments
%    are extended as necessary.
%
%    The arclength coordinate system measures the distance between
%    any two points on the polyline as the length of the segment of the
%    line that joins them.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NK, the number of points defining the polyline.
%
%    Input, real PK(DIM_NUM,NK), the points defining the polyline.
%
%    Input, real T, the desired arclength coordinate.
%
%    Output, real PT(DIM_NUM), the point corresponding to the arclength.
%
  if ( nk <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLYLINE_INDEX_POINT_ND - Fatal error!\n' );
    fprintf ( 1, '  The input quantity NK is nonpositive.\n' );
    fprintf ( 1, '  NK = %d\n', nk );
    error ( 'POLYLINE_INDEX_POINT_ND - Fatal error!' );
  end

  if ( nk == 1 )

    pt(1:dim_num) = pk(1:dim_num,1);

  else

    t2 = 0.0;

    for i = 1 : nk - 1
%
%  Find the distance between points I and I+1.
%
      t1 = t2;
      t2 = t1 + sqrt ( sum ( ( pk(1:dim_num,i+1) - pk(1:dim_num,i) ).^2 ) );
%
%  Interpolate or extrapolate in an interval.
%
      if ( t <= t2 | i == nk - 1 )

        pt(1:dim_num) = ( ( t2 - t      ) * pk(1:dim_num,i)     ...
                     + (      t - t1 ) * pk(1:dim_num,i+1) ) ...
                     / ( t2     - t1 );

        return
      end
    end
  end

  return
end
