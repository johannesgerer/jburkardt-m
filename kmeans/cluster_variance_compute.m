function cluster_variance = cluster_variance_compute ( dim_num, point_num, ...
  cluster_num, point, cluster, cluster_center )

%*****************************************************************************80
%
%% CLUSTER_VARIANCE_COMPUTE computes the variance of the clusters.
%
%  Discussion:
%
%    The cluster variance (from the cluster center) is the average of the
%    sum of the squares of the distances of each point in the cluster to the
%    cluster center.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer POINT_NUM, the number of data points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, real POINT(DIM_NUM,POINT_NUM), the data points.
%
%    Input, integer CLUSTER(POINT_NUM), the cluster to which each
%    data point belongs.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the
%    centers associated with the minimal energy clustering.
%
%    Output, real CLUSTER_VARIANCE(CLUSTER_NUM), the variance
%    associated with each cluster.
%
  cluster_population(1:cluster_num) = 0;
  cluster_variance(1:cluster_num) = 0.0;

  for i = 1 : point_num

    j = cluster(i);

    point_variance = sum ( ...
      ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );

    cluster_variance(j) = cluster_variance(j) + point_variance;
    cluster_population(j) = cluster_population(j) + 1;

  end

  cluster_variance(1:cluster_num) = cluster_variance(1:cluster_num) ...
    ./ cluster_population(1:cluster_num);

  return
end
