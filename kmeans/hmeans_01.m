function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = hmeans_01 ( dim_num, point_num, cluster_num, it_max, point, ...
  cluster, cluster_center )

%*****************************************************************************80
%
%% HMEANS_01 applies the H-Means algorithm.
%
%  Discussion:
%
%    The data for the H-Means problem is a set of N points X in
%    M-dimensions, and a desired number of clusters K.
%
%    The goal is to determine K points Z, called cluster centers, so that
%    if we associate each point X with its nearest Z value, we minimize
%    the standard deviation or cluster energy.  Writing CLUSTER(I) to
%    indicate the index of the nearest cluster center to point X(I), the
%    energy can be written as:
%
%      Energy = Sum ( 1 <= I <= N ) || X(I) - Z(CLUSTER(I)) ||^2
%
%    where
%
%      || X - Z ||^2 = Sum ( 1 <= J <= M ) ( X(J) - Z(J) )^2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Wendy Martinez, Angel Martinez,
%    Computational Statistics Handbook with MATLAB,
%    pages 373-376,
%    Chapman and Hall / CRC, 2002.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer POINT_NUM, the number of data points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, integer IT_MAX, the maximum number of iterations.
%
%    Input, real POINT(DIM_NUM,POINT_NUM), the data points.
%
%    Input, integer CLUSTER(POINT_NUM).  On input, the user 
%    may specify an initial cluster for each point, or leave all entrie of
%    CLUSTER set to 0.  On output, CLUSTER contains the index of the
%    cluster to which each data point belongs.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the 
%    centers associated with the minimal energy clustering.
%
%    Output, integer CLUSTER(POINT_NUM).  On input, the user 
%    may specify an initial cluster for each point, or leave all entrie of
%    CLUSTER set to 0.  On output, CLUSTER contains the index of the
%    cluster to which each data point belongs.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the 
%    centers associated with the minimal energy clustering.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), the number of
%    points assigned to each cluster.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the energy
%    associated with each cluster.
%
%    Output, integer IT_NUM, the number of iterations taken.
%

%
%  Data checks.
%
  if ( cluster_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_01 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'HMEANS_01 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_01 - Fatal error!\n' );
    fprintf ( 1,'  DIM_NUM < 1.\n' );
    error ( 'HMEANS_01 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_01 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'HMEANS_01 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_01 - Fatal error!\n' );
    fprintf ( 1,'  IT_MAX < 0.\n' );
    error ( 'HMEANS_01 - Fatal error!' )
  end
%
%  On input, legal entries in CLUSTER are preserved, but
%  otherwise, each point is assigned to its nearest cluster.
%
  for i = 1 : point_num

    if ( cluster(i) <= 0 | cluster_num < cluster(i) )

      point_energy_min = Inf;

      for j = 1 : cluster_num

        point_energy = sum ( ...
          ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );

        if ( point_energy < point_energy_min )
          point_energy_min = point_energy;
          cluster(i) = j;
        end

      end

    end
  end

  it_num = 0;

  while ( it_num < it_max )

    it_num = it_num + 1;
%
%  #1:
%  Assign each point to the cluster of its nearest center.
%
    swap = 0;

    for i = 1 : point_num

      point_energy_min = Inf;
      c = cluster(i);

      for j = 1 : cluster_num

        point_energy = sum ( ...
          ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );

        if ( point_energy < point_energy_min )
          point_energy_min = point_energy;
          cluster(i) = j;
        end

      end

      if ( c ~= cluster(i) )
        swap = swap + 1;
      end
      
    end
%
%  Terminate if no points were swapped.
%
    if ( 1 < it_num )
      if ( swap == 0 )
        break
      end
    end
%
%  #2:
%  Determine the total energy of the new clustering with current centroids.
%
    cluster_energy(1:cluster_num) = 0.0;

    for i = 1 : point_num

      c = cluster(i);

      cluster_energy(c) = cluster_energy(c) + sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,c) ).^2 );

    end
%
%  #3:
%  Determine the centroids of the clusters.
%
    centroid(1:dim_num,1:cluster_num) = 0.0;
    cluster_population(1:cluster_num) = 0;

    for i = 1 : point_num
      j = cluster(i);
      cluster_population(j) = cluster_population(j) + 1;
      centroid(1:dim_num,j) = centroid(1:dim_num,j) + point(1:dim_num,i);
    end
%
%  Now divide by the population to get the centroid.
%  But if a center has no population, pick a point at random.
%
    missed = 0;

    for j = 1 : cluster_num

      if ( cluster_population(j) ~= 0 )
        centroid(1:dim_num,j) = centroid(1:dim_num,j) / cluster_population(j);
      else
        missed = missed + 1;

        centroid(1:dim_num,j) = point(1:dim_num,missed);

      end

    end

    cluster_center(1:dim_num,1:cluster_num) = centroid(1:dim_num,1:cluster_num);
%
%  #4:
%  Determine the total energy of the current clustering with new centroids.
%
    cluster_energy(1:cluster_num) = 0.0;

    for i = 1 : point_num

      c = cluster(i);

      cluster_energy(c) = cluster_energy(c) + sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,c) ).^2 );

    end
 
  end

  return
end
