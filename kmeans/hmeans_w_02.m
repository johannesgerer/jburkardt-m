function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num, seed ] = hmeans_w_02 ( dim_num, point_num, cluster_num, it_max, ...
  point, weight, cluster, cluster_center, seed )

%*****************************************************************************80
%
%% HMEANS_W_02 applies the weighted H-Means algorithm.
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
%      E(J) = Sum ( 1 <= I <= N ) W(I) * || X(I) - Z(J) ||^2
%
%    Here, we assume that we are using the Euclidean norm, so that
%    
%      || X(I) - Z(J) ||**2 = Sum ( 1 <= K <= M )
%        ( X(I)(K) - Z(J)(K) )^2
%
%    In this notation, X(I)(K) is the K-th spatial component of the
%    I-th data point.
%
%    Note that this routine should give the same results as HMEANS_02
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
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, integer IT_MAX, the maximum number of iterations.
%
%    Input, real POINT(DIM_NUM,POINT_NUM), the coordinates 
%    of the points.
%
%    Input, integer CLUSTER(POINT_NUM), the user 
%    may specify an initial cluster for each point, or leave all entries of
%    CLUSTER set to 0.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the coordinates of the cluster centers.
%
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, integer CLUSTER(POINT_NUM), the index of the
%    cluster to which each data point belongs.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the coordinates of the cluster centers.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), the number of
%    points assigned to each cluster.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the energy of 
%    the clusters.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%

%
%  Data checks.
%
  if ( cluster_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'HMEANS_W_0 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'HMEANS_W_02 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'HMEANS_W_02 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX < 0.\n' );
    error ( 'HMEANS_W_02 - Fatal error!' )
  end

  if ( any ( weight(1:point_num) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  Some weight entry is negative.\n' );
    error ( 'HMEANS_W_02 - Fatal error!' )
  end

  if ( all ( weight(1:point_num) <= 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HMEANS_W_02 - Fatal error!\n' );
    fprintf ( 1, '  No weight entry is positive.\n' );
    error ( 'HMEANS_W_02 - Fatal error!' )
  end
%
%  On input, legal entries in CLUSTER are preserved, but
%  otherwise, each point is assigned to its nearest cluster.
%
  for i = 1 : point_num
    if ( cluster(i) <= 0 || cluster_num < cluster(i) )

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

  while ( 1 )
%
%  Given centers, assign points to nearest center.
%
    cluster_population(1:cluster_num) = 0;
    cluster_weight(1:cluster_num) = 0.0;
    cluster_energy(1:cluster_num) = 0.0;

    swap = 0;

    for i = 1 : point_num

      for j = 1 : cluster_num
        energy(j) = sum ( ...
          ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );
      end

      [ dummy, c ] = min ( energy(1:cluster_num) );

      if ( c ~= cluster(i) )
        swap = swap + 1;
      end

      cluster(i) = c;
      cluster_energy(c) = cluster_energy(c) + weight(i) * energy(c);
      cluster_population(c) = cluster_population(c) + 1;
      cluster_weight(c) = cluster_weight(c) + weight(i);

    end

    if ( 0 < it_num )
      if ( swap == 0 )
        break
      end
    end

    if ( it_max <= it_num )
      break
    end

    it_num = it_num + 1;
%
%  Given points in cluster, replace center by weighted centroid.
%
    cluster_center(1:dim_num,1:cluster_num) = 0.0;
  
    for i = 1 : point_num
      c = cluster(i);
      cluster_center(1:dim_num,c) = cluster_center(1:dim_num,c) ...
        + weight(i) * point(1:dim_num,i);
    end

    for i = 1 : cluster_num
      if ( cluster_weight(i) ~= 0 )
        cluster_center(1:dim_num,i) = cluster_center(1:dim_num,i) / ...
          cluster_weight(i);
      else
        [ j, seed ] = i4_uniform ( 1, point_num, seed );
        cluster_center(1:dim_num,i) = point(1:dim_num,j);
      end
    end

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
