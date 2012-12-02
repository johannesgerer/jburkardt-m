function [ cluster, cluster_center, cluster_energy ] = ...
  cluster_energy_compute ( dim_num, point_num, cluster_num, point, ...
  cluster_center )

%*****************************************************************************80
%
%% CLUSTER_ENERGY_COMPUTE computes the energy of the clusters.
%
%  Discussion:
%
%    The cluster energy is defined as the sum of the distance
%    squared from each point to its cluster center.  It is the goal
%    of the H-means and K-means algorithms to find, for a fixed number
%    of clusters, a clustering that minimizes this energy
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
%    Input, integer POINT_NUM, the number of data points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, real  POINT(DIM_NUM,POINT_NUM), the data points.
%
%    Input, integer CLUSTER(POINT_NUM), the cluster to which each
%    data point belongs.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the centers.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the energy
%    associated with each cluster.
%
  cluster_energy(1:cluster_num) = 0.0;

  for i = 1 : point_num

    j = cluster(i);

    point_energy = sum ( ...
      ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );

    cluster_energy(j) = cluster_energy(j) + point_energy;

  end

  return
end