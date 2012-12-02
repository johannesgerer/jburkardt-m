function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = kmeans_w_03 ( dim_num, point_num, cluster_num, it_max, ...
  point, weight, cluster, cluster_center  )

%*****************************************************************************80
%
%% KMEANS_W_03 applies the weighted K-Means algorithm.
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
%    Note that this routine should give the same results as KMEANS_01
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
%    Input, real WEIGHT(POINT_NUM), the weights.
%
%    Input, integer CLUSTER(POINT_NUM), the cluster 
%    to which each point belongs. 
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the
%    centers associated with the clustering. 
%
%    Output, integer CLUSTER(POINT_NUM), the cluster 
%    to which each point belongs.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the
%    centers associated with the clustering. 
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), the number
%    of points in each cluster.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the energy of
%    the clusters.
%
%    Output, integer IT_NUM, the number of iterations taken.
%

%
%  Check the input.
%
  if ( cluster_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX < 0.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end

  if ( any ( weight(1:point_num) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  Some weight entry is negative.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end

  if ( all ( weight(1:point_num) <= 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_W_03 - Fatal error!\n' );
    fprintf ( 1, '  No weight entry is positive.\n' );
    error ( 'KMEANS_W_03 - Fatal error!' )
  end
%
%  Assign each observation to the nearest cluster center.
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
    ci = cluster(i);
    cluster_population(ci) = cluster_population(ci) + 1;
    cluster_weight(ci) = cluster_weight(ci) + weight(i);
  end
%
%  Average the points in each cluster to get a new cluster center.
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
%  Carry out the iteration.
%
  it_num = 0;

  distsq = zeros ( cluster_num );

  while ( it_num < it_max )

    it_num = it_num + 1;

    swap = 0;

    for i = 1 : point_num

      ci = cluster(i);

      if ( cluster_population(ci) <= 1 )
        continue
      end

      for cj = 1 : cluster_num

        if ( cj == ci )

          distsq(cj) = sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,cj) ).^2 ) ...
            * cluster_weight(cj)  ...
            / ( cluster_weight(cj) - weight(i) );

        else if ( cluster_population(cj) == 0 )

          cluster_center(1:dim_num,cj) = point(1:dim_num,i);
          distsq(cj) = 0.0;

        else

          distsq(cj) = sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,cj) ).^2 ) ...
            * cluster_weight(cj) ...
            / ( cluster_weight(cj) + weight(i) );

        end

      end
%
%  Find the index of the minimum value of DISTSQ.
%
      [ dummy, list ] = min ( distsq(1:cluster_num) );
%
%  If that is not the cluster to which point I now belongs, move it there.
%
      if ( list(1) == ci )
        continue
      end

      cj = list(1);

      cluster_center(1:dim_num,ci) = ...
        ( cluster_weight(ci) * cluster_center(1:dim_num,ci) ...
        - weight(i) * point(1:dim_num,i) ) ...
        / ( cluster_weight(ci) - weight(i) );

      cluster_center(1:dim_num,cj) = ...
        ( cluster_weight(cj) * cluster_center(1:dim_num,cj) ...
        + weight(i) * point(1:dim_num,i) ) ...
        / ( cluster_weight(cj) + weight(i) );

      cluster_population(ci) = cluster_population(ci) - 1;
      cluster_population(cj) = cluster_population(cj) + 1;

      cluster_weight(ci) = cluster_weight(ci) - weight(i);
      cluster_weight(cj) = cluster_weight(cj) + weight(i);

      cluster(i) = cj;

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

    ci = cluster(i);

    cluster_energy(ci) = cluster_energy(ci) + weight(i) * sum ( ...
      ( point(1:dim_num,i) - cluster_center(1:dim_num,ci) ).^2 );

  end

  return
end
