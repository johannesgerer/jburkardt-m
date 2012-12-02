function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = kmeans_01 ( dim_num, point_num, cluster_num, it_max, point, ...
  cluster_center )

%*****************************************************************************80
%
%% KMEANS_01 applies the K-Means algorithm.
%
%  Discussion:
%
%    Given a matrix of POINT_NUM observations on DIM_NUM variables, the
%    observations are to be allocated to CLUSTER_NUM clusters in such 
%    a way that the within-cluster sum of squares is minimized.
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
%    Original FORTRAN77 version by David Sparks.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    David Sparks,
%    Algorithm AS 58: 
%    Euclidean Cluster Analysis,
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
    fprintf ( 1, 'KMEANS_01 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'KMEANS_01 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_01 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'KMEANS_01 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_01 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'KMEANS_01 - Fatal error!' )
  end
%
%  For each observation, calculate the distance from each cluster
%  center, and assign to the nearest.
%
  for i = 1 : point_num

    for j = 1 : cluster_num
      cluster_energy(j) = sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );
    end

    [ dummy, cluster(i) ] = min ( cluster_energy(1:cluster_num) );

  end
%
%  Determine the cluster population counts.
%
  cluster_population(1:cluster_num) = 0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_population(j) = cluster_population(j) + 1;
  end
%
%  Calculate the mean and sum of squares for each cluster.
%
  cluster_center(1:dim_num,1:cluster_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_center(1:dim_num,j) = cluster_center(1:dim_num,j) ...
      + point(1:dim_num,i);
  end

  for i = 1 : cluster_num
    if ( 0 < cluster_population(i) )
      cluster_center(1:dim_num,i) = cluster_center(1:dim_num,i) ...
        / cluster_population(i);
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
    cluster_energy(j) = cluster_energy(j) + f(i);
  end
%
%  Adjust the point energies by a weight factor.
%
  for i = 1 : point_num
    j = cluster(i);
    if ( 1 < cluster_population(j) )
      f(i) = f(i) * cluster_population(j) / ( cluster_population(j) - 1 );
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
            * cluster_population(j) / ( cluster_population(j) + 1 );

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
        ( cluster_center(1:dim_num,il) * cluster_population(il) ...
        - point(1:dim_num,i) ) / ( cluster_population(il) - 1 );

      cluster_center(1:dim_num,ir) = ...
        ( cluster_center(1:dim_num,ir) * cluster_population(ir) ...
        + point(1:dim_num,i) ) / ( cluster_population(ir) + 1 );

      cluster_energy(il) = cluster_energy(il) - f(i);
      cluster_energy(ir) = cluster_energy(ir) + dc;
      cluster_population(ir) = cluster_population(ir) + 1;
      cluster_population(il) = cluster_population(il) - 1;

      cluster(i) = ir;
%
%  Adjust the value of F for points in clusters IL and IR.
%
      for j = 1 : point_num

        k = cluster(j);

        if ( k == il | k == ir )

          f(j) = sum ( ...
           ( point(1:dim_num,j) - cluster_center(1:dim_num,k) ).^2 );

          if ( 1 < cluster_population(k) )
            f(j) = f(j) * cluster_population(k) / ( cluster_population(k) - 1 );
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
%  Compute the cluster energies.
%
  cluster_energy(1:cluster_num) = 0.0;

  for i = 1 : point_num

    j = cluster(i);

    cluster_energy(j) = cluster_energy(j) + sum ( ...
      ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );

  end

  return
end
