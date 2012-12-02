function x = scale_to_ball01 ( dim_num, n, x )

%*****************************************************************************80
%
%% SCALE_TO_BALL01 translates and rescales data to fit within the unit ball.
%
%  Discussion:
%
%    Completely arbitrary input data is given.
%
%    The average of the data is computed, and taken as the coordinates
%    of the center C of a sphere.  The radius R of that sphere is the
%    distance from the center to the furthest point in the data set.
%
%    Then each point is transformed to the ball of center 0 and radius
%    1 by subtracting C and dividing by R:
%
%      X(1:DIM_NUM,J) -> ( X(1:DIM_NUM,J) - C(1:DIM_NUM) ) / R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, real X(DIM_NUM,N), the data to be modified.
%

%
%  Determine the center.
%
  for i = 1 : dim_num
    xave(i) = sum ( x(i,1:n) ) / n;
  end
%
%  Determine SCALE, the maximum distance of any point X from the center.
%
  for j = 1 : n
    r(j) = sum ( ( x(1:dim_num,j) - xave(1:dim_num) ).^2 )
  end

  scale = sqrt ( max ( r(1:n) ) );
%
%  Dividing all values by SCALE will guarantee that every point is
%  inside the unit sphere, and one point at least is ON the sphere.
%
  if ( 0.0 < scale )
    for i = 1 : dim_num
      x(i,1:n) = ( x(i,1:n) - xave(i) ) / scale;
    end
  else
    x(1:dim_num,1:n) = 0.0;
  end

  return
end
