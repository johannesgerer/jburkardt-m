function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = hmeans_w_01 ( dim_num, point_num, cluster_num, it_max, point, weight, ...
  cluster, cluster_center, cluster_population )

%*****************************************************************************80
%
%% HMEANS_W_01 applies the weighted H-Means algorithm. 
%
%  Discussion:
%
%    The input data for the weight H-Means problem includes:
%    * a set of N data points X in M dimensions, 
%    * a set of N nonnegative weights W,
%    * a desired number of clusters K.
%    * an initial set of cluster centers Z,
%    * an (optional) initial set of cluster assignments.
%
%    The goal is to determine K points Z, called cluster centers, and
%    to assign each point X(I) to some cluster Z(J), so that we minimize
%    the weighted standard deviation of the distance of each data point
%    to the center of its cluster.  Writing J = CLUSTER(I) to
%    indicate the index of the nearest cluster center Z(J) to the 
%    point X(I), the quantity we are trying to minimize is the sum
%    of the weighted cluster energies E(J), where:
%
%      E(J) = Sum ( 1 <= I <= N ) W(I) * || X(I) - Z(J) ||**2
%
%    Here, we assume that we are using the Euclidean norm, so that
%    
%      || X(I) - Z(J) ||**2 = Sum ( 1 <= K <= M )
%        ( X(I)(K) - Z(J)(K) )**2
%
%    In this notation, X(I)(K) is the K-th spatial component of the
%    I-th data point.
%
%    Note that this routine should give the same results as HMEANS_01
%    in any case in which all the entries of the WEIGHT vector are equal.
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
%    Input, real WEIGHT(POINT_NUM), the weights
%    assigned to the data points.  These must be nonnegative, and
%    at least one must be strictly positive.
%
%    Input, integer CLUSTER(POINT_NUM), the user 
%    may specify an initial cluster for each point, or leave all entries of
%    CLUSTER set to 0. 
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the
%    centers associated with the minimal energy clustering.
%
%    Output, integer CLUSTER(POINT_NUM).the index of the
%    cluster to which each data point belongs.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the
%    centers associated with the minimal energy clustering.
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
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX < 0.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
  end

  if ( any ( weight(1:point_num) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  Some weight entry is negative.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
  end

  if ( all ( weight(1:point_num) <= 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  No weight entry is positive.\n' );
    error ( 'HMEANS_W_01 - Fatal error!' )
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
%  Reassign points to clusters:
%  Assign each point to the cluster whose center is nearest;
%  Count the number of points whose cluster assignment is changed.
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
%  If no point changed its cluster assignment, the algorithm can make no 
%  more improvements, so terminate.
%
    if ( 1 < it_num )
      if ( swap == 0 )
        break
      end
    end
%
%  Determine the current energy.
%
    energy = 0.0;
    for i = 1 : point_num
      energy = energy + weight(i) * sum ( ...
          ( point(1:dim_num,i) - cluster_center(1:dim_num,cluster(i)) ).^2 );
    end
%
%  #2:
%  Determine the centroids of the clusters, and set the 
%  cluster center to the cluster centroid.
%
    centroid(1:dim_num,1:cluster_num) = 0.0;
    cluster_population(1:cluster_num) = 0;
    cluster_weight(1:cluster_num) = 0.0;

    for i = 1 : point_num
      c = cluster(i);
      cluster_population(c) = cluster_population(c) + 1;
      cluster_weight(c) = cluster_weight(c) + weight(i);
      centroid(1:dim_num,c) = centroid(1:dim_num,c) ...
        + weight(i) * point(1:dim_num,i);
    end

    missed = 0;

    for c = 1 : cluster_num

      if ( cluster_weight(c) ~= 0.0 )
        centroid(1:dim_num,c) = centroid(1:dim_num,c) / cluster_weight(c);
      else
        missed = missed + 1;
        centroid(1:dim_num,c) = point(1:dim_num,missed);
      end

    end

    cluster_center(1:dim_num,1:cluster_num) = centroid(1:dim_num,1:cluster_num);

  end
%
%  Compute the energy based on the final value of the cluster centers.
%
  cluster_energy(1:cluster_num) = 0.0;

  for i = 1 : point_num

    c = cluster(i);

    cluster_energy(c) = cluster_energy(c) + weight(i) * sum ( ...
      ( point(1:dim_num,i) - cluster_center(1:dim_num,c) ).^2 );

  end

  return
end
