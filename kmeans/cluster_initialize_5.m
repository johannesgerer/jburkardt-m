function [ cluster_center, seed ] = cluster_initialize_5 ( dim_num, ...
  point_num, cluster_num, point, seed )

%*****************************************************************************80
%
%% CLUSTER_INITIALIZE_5 initializes the cluster centers to random values.
%
%  Discussion:
%
%    In this case, each cluster center is a random convex combination 
%    of the data points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, real POINT(DIM_NUM,POINT_NUM), the coordinates 
%    of the points.
%
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the coordinates of the cluster centers.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%

%
%  Get a PxC block of random factors.
%
  [ factor, seed ] = r8mat_uniform_01 ( point_num, cluster_num, seed );
%
%  Make each column of factors have unit sum.
%
  for j = 1 : cluster_num
    column_sum = sum ( factor(1:point_num,j) );
    factor(1:point_num,j) = factor(1:point_num,j) / column_sum;
  end
%
%  Set centers = points * factors.
%
  cluster_center(1:dim_num,1:cluster_num) = ...
    point(1:dim_num,1:point_num) * factor(1:point_num,1:cluster_num);

  return
end
