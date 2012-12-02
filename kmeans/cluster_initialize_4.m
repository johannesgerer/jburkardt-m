function [ cluster_center, seed ] = cluster_initialize_4 ( dim_num, ...
  point_num, cluster_num, point, seed )

%*****************************************************************************80
%
%% CLUSTER_INITIALIZE_4 initializes the cluster centers to random values.
%
%  Discussion:
%
%    In this case, each data point is divided randomly among the
%    the cluster centers.
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
  cluster_center(1:dim_num,1:cluster_num) = 0.0;
  cluster_weight(1:cluster_num) = 0.0;

  for i = 1 : point_num

    [ cluster_factor, seed ] = r8vec_uniform_01 ( cluster_num, seed );

    divisor = sum ( cluster_factor(1:cluster_num) );
    cluster_factor(1:cluster_num) = cluster_factor(1:cluster_num) / divisor;

    for j = 1 : cluster_num
      cluster_center(1:dim_num,j) = cluster_center(1:dim_num,j) ...
        + cluster_factor(j) * point(1:dim_num,i);
    end

    cluster_weight(1:cluster_num) = cluster_weight(1:cluster_num) ...
      + cluster_factor(1:cluster_num);

  end
%
%  Now normalize,  so that each cluster center is now a convex 
%  combination of the points.
%
  for i = 1 : cluster_num
    cluster_center(1:dim_num,i) = cluster_center(1:dim_num,i) ...
      / cluster_weight(i);
  end

  return
end
