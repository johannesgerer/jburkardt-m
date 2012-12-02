function [ average, sd, covc ] = covariance ( dim_num, point_num, x )

%*****************************************************************************80
%
%% COVARIANCE does a covariance calculation for IHS solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to be generated.
%
%    Input, integer X(DIM_NUM,POINT_NUM), the points.
%
%    Output, real AVERAGE, the average minimum distance.
%
%    Output, real SD, the standard deviation of the minimum distances.
%
%    Output, real COVC, the covariance of the minimum distances.
%

%
%  Set up the distance matrix.
%
  for i = 1 : point_num
    mindist(i) = realmax;
    for j = 1 : point_num
      if ( i ~= j )
        vec(1:dim_num) = x(1:dim_num,i) - x(1:dim_num,j);
        dist = sqrt ( vec(1:dim_num) * vec(1:dim_num)' );
        if ( dist < mindist(i) )
          mindist(i) = dist;
        end
      end
    end
  end
%
%  Find the average minimum distance.
%
  average = sum ( mindist(1:point_num) ) / point_num;
%
%  Compute the standard deviation of the distances.
%
  sd = std ( mindist(1:point_num) );
%
%  Compute the covariance.
%
  covc = sd / average;

  return
end
