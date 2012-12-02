function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = kmeans_w_01 ( dim_num, point_num, cluster_num, it_max, ...
  point, weight, cluster_center )

%*****************************************************************************80
%
%% KMEANS_W_01 applies the weighted K-Means algorithm.
%
%  Discussion:
%
%    The input data for the weight K-Means problem includes:
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
%         ( X(I)(K) - Z(J)(K) ).^2
%
%    In this notation, X(I)(K) is the K-th spatial component of the
%    I-th data point.
%
%    Note that this routine should give the same results as KMEANS_01
%    in any case in which all the entries of the WEIGHT vector are equal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Sparks,
%    Algorithm AS 58: Euclidean Cluster Analysis,
%    Applied Statistics,
%    Volume 22, Number 1, 1973, pages 126-130.
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
%    Input, real POINT(DIM_NUM,POINT_NUM), the points.
%
%    Input, real WEIGHT(POINT_NUM), the weights.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER(POINT_NUM), indicates which cluster
%    each point belongs to.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), the number 
%    of points in each cluster.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the 
%    cluster energies.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
  it_num = 0;
%
%  Idiot checks.
%
  if ( cluster_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX < 0.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end

  if ( any ( weight(1:point_num) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  Some weight entry is negative.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end

  if ( all ( weight(1:point_num) <= 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_01 - Fatal error!\n' );
    fprintf ( 1, '  No weight entry is positive.\n' );
    error ( 'KMEANS_W_01 - Fatal error!' )
  end
%
%  Assign each point to the nearest cluster.
%
  for i = 1 : point_num

    for j = 1 : cluster_num
      cluster_energy(j) = sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );
    end

    [ dummy, cluster(i) ] = min ( cluster_energy(1:cluster_num) );

  end
%
%  Determine the cluster populations and weights.
%
  cluster_population(1:cluster_num) = 0;
  cluster_weight(1:cluster_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_population(j) = cluster_population(j) + 1;
    cluster_weight(j) = cluster_weight(j) + weight(i);
  end
%
%  Calculate the mean and sum of squares for each cluster.
%
  cluster_center(1:dim_num,1:cluster_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_center(1:dim_num,j) = cluster_center(1:dim_num,j) ...
      + weight(i) * point(1:dim_num,i);
  end

  for i = 1 : cluster_num
    if ( 0.0 < cluster_weight(i) )
      cluster_center(1:dim_num,i) = cluster_center(1:dim_num,i) ...
        / cluster_weight(i);
    end
  end
%
%  Set the point energies.
%
  f(1:point_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    f(i) = sum ( ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );
  end
%
%  Set the cluster energies.
%
  cluster_energy(1:cluster_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_energy(j) = cluster_energy(j) + weight(i) * f(i);
  end
%
%  Adjust the point energies by a weight factor.
%
  for i = 1 : point_num
    j = cluster(i);
    if ( weight(i) < cluster_weight(j) )
      f(i) = f(i) * cluster_weight(j) / ( cluster_weight(j) - weight(i) );
    end
  end
%
%  Examine each observation in turn to see if it should be
%  reassigned to a different cluster.
%
  it_num = 0;

  while ( it_num < it_max )

    it_num = it_num + 1;

    swap = 0;

    for i = 1 : point_num

      il = cluster(i);
      ir = il;

      if ( cluster_population(il) <= 1 )
        continue
      end

      dc = f(i);

      for j = 1 : cluster_num

        if ( j ~= il )

          de = sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 ) ...
            * cluster_weight(j) / ( cluster_weight(j) + weight(i) );

          if ( de < dc )
            dc = de;
            ir = j;
          end

        end

      end
%
%  If the lowest value was obtained by staying in the current cluster,
%  then cycle.
%
      if ( ir == il )
        continue
      end
%
%  Reassign the point from cluster IL to cluster IR.
%
      cluster_center(1:dim_num,il) = ...
        ( cluster_weight(il) * cluster_center(1:dim_num,il) ...
        - weight(i) * point(1:dim_num,i) ) ...
        / ( cluster_weight(il) - weight(i) );

      cluster_center(1:dim_num,ir) = ...
        ( cluster_weight(ir) * cluster_center(1:dim_num,ir) ...
        + weight(i) * point(1:dim_num,i) ) ...
        / ( cluster_weight(ir) + weight(i) );

      cluster_weight(il) = cluster_weight(il) - weight(i);
      cluster_weight(ir) = cluster_weight(ir) + weight(i);

      cluster_energy(il) = cluster_energy(il) - f(i);
      cluster_energy(ir) = cluster_energy(ir) + dc;

      cluster_population(ir) = cluster_population(ir) + 1;
      cluster_population(il) = cluster_population(il) - 1;

      cluster(i) = ir;
%
%  Adjust the value of F for all points in clusters IL and IR.
%
      for j = 1 : point_num

        k = cluster(j);

        if ( k == il | k == ir )

          f(j) = sum ( ...
           ( point(1:dim_num,j) - cluster_center(1:dim_num,k) ).^2 );

          if ( weight(j) < cluster_weight(k) )
            f(j) = f(j) * cluster_weight(k) ...
              / ( cluster_weight(k) - weight(j) );
          end

        end

      end

      swap = swap + 1;

    end
%
%  Exit if no reassignments were made during this iteration.
%
    if ( swap == 0 )
      break
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
