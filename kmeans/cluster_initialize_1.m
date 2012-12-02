function cluster_center = cluster_initialize_1 ( dim_num, point_num, ...
  cluster_num, point )

%*****************************************************************************80
%
%% CLUSTER_INITIALIZE_1 initializes the clusters to data points.
%
%  Discussion:
%
%    The cluster centers are simply chosen to be the first data points.
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
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the coordinates of the cluster centers.
%
  cluster_center(1:dim_num,1:cluster_num) = point(1:dim_num,1:cluster_num)

  return
end