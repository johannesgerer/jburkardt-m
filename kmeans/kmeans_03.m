function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = kmeans_03 ( dim_num, point_num, cluster_num, it_max, point, ...
  cluster_center )

%*****************************************************************************80
%
%% KMEANS_03 applies the K-Means algorithm.
%
%  Discussion:
%
%    It is possible for a straightforward K-Means algorithm to
%    halt at a non-optimal partition of the points.  This routine
%    tries to improve the input partition if possible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 October 2009
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
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM), the 
%    centers associated with the clustering.
%
%    Output, integer CLUSTER(POINT_NUM), the cluster to which
%    each point belongs.
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
    fprintf ( 1, 'KMEANS_03 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'KMEANS_03 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_03 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'KMEANS_03 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_03 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'KMEANS_03 - Fatal error!' )
  end

  if ( it_max < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_03 - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX < 0.\n' );
    error ( 'KMEANS_03 - Fatal error!' )
  end
%
%  Assign each point to the nearest cluster center.
%
  for i = 1 : point_num

    for j = 1 : cluster_num
      cluster_energy(j) = sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,j) ).^2 );
    end

    [ dummy, cluster(i) ] = min ( cluster_energy(1:cluster_num) );

  end
%
%  Determine the cluster populations.
%
  cluster_population(1:cluster_num) = 0;
  for i = 1 : point_num
    ci = cluster(i);
    cluster_population(ci) = cluster_population(ci) + 1;
  end
%
%  Average the points in each cluster to get a new cluster center.
%
  cluster_center(1:dim_num,1:cluster_num) = 0.0;

  for i = 1 : point_num
    j = cluster(i);
    cluster_center(1:dim_num,j) = cluster_center(1:dim_num,j) ...
      + point(1:dim_num,i);
  end

  for i = 1 : cluster_num
    cluster_center(1:dim_num,i) = cluster_center(1:dim_num,i) ...
      / cluster_population(i);
  end
%
%  Carry out the iteration.
%
  it_num = 0;

  while ( it_num < it_max )

    it_num = it_num + 1;

    swap = 0;

    for i = 1 : point_num

      ci = cluster(i);

      if ( cluster_population(ci) <= 1 )
        continue;
      end

      for cj = 1 : cluster_num

        if ( cj == ci )

          distsq(cj) = sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,cj) ).^2 ) ...
            * cluster_population(cj) / ( cluster_population(cj) - 1 );

        elseif ( cluster_population(cj) == 0 )

          cluster_center(1:dim_num,cj) = point(1:dim_num,i);
          distsq(cj) = 0.0;

        else

          distsq(cj) = sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,cj) ).^2 ) ...
            * cluster_population(cj) / ( cluster_population(cj) + 1 );

        end

      end
%
%  Find the index of the minimum value of DISTSQ.
%
      [ dummy, cj ] = min ( distsq(1:cluster_num) );
%
%  If that is not the cluster to which point I now belongs, move it there.
%
      if ( cj == ci )
        continue
      end

      cluster_center(1:dim_num,ci) = ...
        ( cluster_population(ci) * cluster_center(1:dim_num,ci) ...
        - point(1:dim_num,i) ) / ( cluster_population(ci) - 1 );

      cluster_center(1:dim_num,cj) = ...
        ( cluster_population(cj) * cluster_center(1:dim_num,cj) ...
        + point(1:dim_num,i) ) / ( cluster_population(cj) + 1 );

      cluster_population(ci) = cluster_population(ci) - 1;
      cluster_population(cj) = cluster_population(cj) + 1;

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
