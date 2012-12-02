function [ cluster_center, seed ] = cluster_initialize_2 ( dim_num, ...
  point_num, cluster_num, point, seed )

%*****************************************************************************80
%
%% CLUSTER_INITIALIZE_2 initializes the cluster centers to random values.
%
%  Discussion:
%
%    In this case, the hyperbox containing the data is computed.
%
%    Then the cluster centers are chosen uniformly at random within
%    this hyperbox.
%
%    Of course, if the data is not smoothly distributed throughout
%    the box, many cluster centers will be isolated.
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
  r_min(1) = min ( point(1,1:point_num);
  r_min(2) = min ( point(2,1:point_num);
  r_max(1) = max ( point(1,1:point_num);
  r_max(2) = max ( point(2,1:point_num);

  for i = 1 : cluster_num

    [ r, seed ] = r8vec_uniform_01 ( dim_num, seed );

    cluster_center(1:dim_num,i) = ...
      ( 1.0 - r(1:dim_num) ) * r_min(1:dim_num) ...
            + r(1:dim_num)   * r_max(1:dim_num);
  end
    
  return
end
