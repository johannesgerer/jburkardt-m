function xy = xy_example ( point_num )

%*****************************************************************************80
%
%% XY_EXAMPLE sets up sample XY data suitable for an XY file.
%
%  Discussion:
%
%    The points lie on a spiral in the unit square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Output, real XY(2,POINT_NUM), the coordinates of the points.
%
  turns = 5;

  for ( j = 1 : point_num )
    r = ( j - 1 ) / ( point_num - 1 );
    theta = turns * r * ( 2.0 * pi );
    xy(1,j) = r * cos ( theta );
    xy(2,j) = r * sin ( theta );
  end

  xy(1,1:point_num) = 0.5 * ( 1.0 + xy(1,1:point_num) );
  xy(2,1:point_num) = 0.5 * ( 1.0 + xy(2,1:point_num) );

  return
end
