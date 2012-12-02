function boundary = p13_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P13_BOUNDARY_NEAREST returns a nearest boundary point in problem 13.
%
%  Discussion:
%
%    The correct computation of the distance to the boundary of the
%    region in this problem is complicated for points in the
%    exterior which must choose between the vertical shaft and
%    the semicircular annulus.  For our purposes, it is not essential
%    to get this computation exactly, so we crudely draw a 45 degree
%    dividing line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, real BOUNDARY(M,N), points on the boundary
%    that are nearest to each point.
%
  angle2 = acos ( 5.0 / 40.0 );
  angle3 = pi - angle2;

  y2 = 40.0 * sin ( angle2 );

  for j = 1 : n

    r = sqrt ( ( point(1,j) - 50.0 ).^2 + ( point(2,j) - 0.0 ).^2 );
    angle = atan2 ( point(2,j), point(1,j) - 50.0 );
%
%  1. Left side of left foot
%
    if ( point(1,j) <= 10.0 & point(2,j) <= 0.0 )

      boundary(1:2,j) = [ 10.0, 0.0 ]';
%
%  2. Left foot
%
    elseif ( point(1,j) <= 20.0 & point(2,j) <= 0.0 )

      boundary(1:2,j) = [ point(1,j), 0.0 ]';
%
%  3. Right side of left foot
%
    elseif ( point(1,j) <= 50.0 & point(2,j) <= 0.0 )

      boundary(1:2,j) = [ 20.0, 0.0 ]';
%
%  4.  Left side of right foot.
%
    elseif ( point(1,j) <= 80.0 & point(2,j) <= 0.0 )

      boundary(1:2,j) = [ 80.0, 0.0 ]';
%
%  5.  Right Foot
%
    elseif ( point(1,j) <= 90.0 & point(2,j) <= 0.0 )

      boundary(1:2,j) = [ point(1,j), 0.0 ]';
%
%  6.  Right side of right foot.
%
    elseif ( point(2,j) <= 0.0 )

      boundary(1:2,j) = [ 90.0, 0.0 ]';
%
%  7.  Space between legs.
%
    elseif ( r <= 30.0 )

      boundary(1,j) = 50.0 + 30.0 * cos ( angle );
      boundary(2,j) =  0.0 + 30.0 * sin ( angle );
%
%  8.  Right inside of left leg.
%
    elseif ( r <= 35.0 & point(1,j) <= 45.0 )

      boundary(1,j) = 50.0 + 30.0 * cos ( angle );
      boundary(2,j) =  0.0 + 30.0 * sin ( angle );
%
%  9.  Crotch.
%
    elseif ( r <= 35.0 & point(1,j) <= 55.0 )

      boundary(1,j) = 50.0 + 30.0 * cos ( angle );
      boundary(2,j) =  0.0 + 30.0 * sin ( angle );
%
%  10.  Left inside of right leg.
%
    elseif ( r <= 35.0 & 55.0 <= point(1,j) )

      boundary(1,j) = 50.0 + 30.0 * cos ( angle );
      boundary(2,j) =  0.0 + 30.0 * sin ( angle );
%
%  11.  Left inside of left leg.
%
    elseif ( r <= 40.0 & point(1,j) <= 45.0 )

      boundary(1,j) = 50.0 + 40.0 * cos ( angle );
      boundary(2,j) =  0.0 + 40.0 * sin ( angle );
%
%  12.  Left hip.
%
    elseif ( r <= 40.0 & point(1,j) <= 50.0 & point(2,j) <= y2 )

      boundary(1,j) = [ 45.0, y2 ]';
%
%  13.  Right hip.
%
    elseif ( r <= 40.0 & point(1,j) <= 55.0 & point(2,j) <= y2 )

      boundary(1:2,j) = [ 55.0, y2 ]';
%
%  14.  Right inside of right leg.
%
    elseif ( r <= 40.0 )

      boundary(1,j) = 50.0 + 40.0 * cos ( angle );
      boundary(2,j) =  0.0 + 40.0 * sin ( angle );
%
%  15.  Left outside of left leg.
%
    elseif ( angle3 < angle )

      boundary(1,j) = 50.0 + 30.0 * cos ( angle );
      boundary(2,j) =  0.0 + 30.0 * sin ( angle );
%
%  16.  Right outside of right leg.
%
    elseif ( angle < angle2 )

      boundary(1,j) = 50.0 + 40.0 * cos ( angle );
      boundary(2,j) =  0.0 + 40.0 * sin ( angle );
%
%  17.  Left outside of trunk.
%
    elseif ( point(1,j) <= 45.0 & point(2,j) <= 90.0 )

      boundary(1:2,j) = [ 45.0, point(2,j) ]';
%
%  18.  Left inside of trunk.
%
    elseif ( point(1,j) <= 50.0 & point(2,j) <= 90.0 & ...
      point(1,j) + point(2,j) <= 135.0 )

      boundary(1:2,j) = [ 45.0, point(2,j) ]';
%
%  22.5 Throat
%
    elseif ( point(1,j) <= 50.0 & point(2,j) <= 90.0 & ...
      135.0 <= point(1,j) + point(2,j) )

        boundary(1:2,j) = [ point(1,j), 90.0 ]';

    elseif ( point(1,j) <= 55.0 & point(2,j) <= 90.0 & ...
      35.0 <= point(2,j) - point(1,j) )

        boundary(1:2,j) = [ point(1,j), 90.0 ]';
%
%  19.  Right inside of trunk.
%
    elseif ( point(1,j) <= 55.0 & point(2,j) <= 90.0 & ...
      point(2,j) - point(1,j) <= 35.0 )

      boundary(1:2,j) = [ 55.0, point(2,j) ]';
%
%  20.  Right outside of trunk.
%
    elseif ( 55.0 <= point(1,j) & point(2,j) <= 90.0 )

      boundary(1:2,j) = [ 55.0, point(2,j) ]';
%
%  21.  Left shoulder.
%
    elseif ( point(1,j) <= 45.0 )

      boundary(1:2,j) = [ 45.0, 90.0 ]';
%
%  22.  Neck.
%
    elseif ( point(1,j) <= 55.0 )

      boundary(1:2,j) = [ point(1,j), 90.0 ]';
%
%  23.  Right Shoulder.
%
    elseif ( 55.0 <= point(1,j) & 90.0 <= point(2,j) )

      boundary(1:2,j) = [ 55.0, 90.0 ]';
%
%  Missing?
%
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P13_BOUNDARY_NEAREST - Fatal error!\n' );
      fprintf ( 1, '  Orphan point = ( %f, %f )\n', point(1:2,j) );
      error ( 'P13_BOUNDARY_NEAREST - Fatal error!' );
    end

  end

  return
end

