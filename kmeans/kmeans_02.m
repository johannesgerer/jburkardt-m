function [ cluster, cluster_center, cluster_population, cluster_energy, ...
  it_num ] = kmeans_02 ( dim_num, point_num, cluster_num, it_max, point, ...
  cluster_center )

%*****************************************************************************80
%
%% KMEANS_02 applies the K-Means algorithm.
%
%  Discussion:
%
%    The routine attempts to divide POINT_NUM points in 
%    DIM_NUM-dimensional space into CLUSTER_NUM clusters so that the within 
%    cluster sum of squares is minimized.
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
%    Original FORTRAN77 by John Hartigan, Manchek Wong.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    John Hartigan, Manchek Wong,
%    Algorithm AS 136:
%    A K-Means Clustering Algorithm,
%    Applied Statistics,
%    Volume 28, Number 1, 1979, pages 100-108.
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
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER(POINT_NUM), the cluster each 
%    point belongs to.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), the number 
%    of points in each cluster.
%
%    Output, real CLUSTER_ENERGY(CLUSTER_NUM), the 
%    within-cluster sum of squares.
%
%    Output, integer IT_NUM, the number of iterations taken.
%
  it_num = 0;

  if ( cluster_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_02 - Fatal error!\n' );
    fprintf ( 1, '  CLUSTER_NUM < 1.\n' );
    error ( 'KMEANS_02 - Fatal error!' )
  end

  if ( point_num <= cluster_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_02 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM <= CLUSTER_NUM.\n' );
    error ( 'KMEANS_02 - Fatal error!' )
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_02 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    error ( 'KMEANS_02 - Fatal error!' )
  end

  if ( point_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_02 - Fatal error!\n' );
    fprintf ( 1, '  POINT_NUM < 1.\n' );
    error ( 'KMEANS_02 - Fatal error!' )
  end
%
%  For each point I, find its two closest centers, CLUSTER(I) and CLUSTER2(I).
%  Assign it to CLUSTER(I).
%
  for i = 1 : point_num

    cluster(i) = 1;
    cluster2(i) = 2;

    for il = 1 : 2
      dt(il) = sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,il) ).^2 );
    end

    if ( dt(2) < dt(1) )
      cluster(i) = 2;
      cluster2(i) = 1;
      temp = dt(1);
      dt(1) = dt(2);
      dt(2) = temp;
    end

    for l = 3 : cluster_num

      db = sum ( ( point(1:dim_num,i) - cluster_center(1:dim_num,l) ).^2 );

      if ( db < dt(1) )
        dt(2) = dt(1);
        cluster2(i) = cluster(i);
        dt(1) = db;
        cluster(i) = l;
      elseif ( db < dt(2) )
        dt(2) = db;
        cluster2(i) = l;
      end

    end

  end
%
%  Update cluster centers to be the average of points contained within them.
%
  cluster_population(1:cluster_num) = 0;
  cluster_center(1:dim_num,1:cluster_num) = 0.0;

  for i = 1 : point_num
    l = cluster(i);
    cluster_population(l) = cluster_population(l) + 1;
    cluster_center(1:dim_num,l) = cluster_center(1:dim_num,l) ...
      + point(1:dim_num,i);
  end
%
%  Check to see if there is any empty cluster.
%
  for l = 1 : cluster_num

    if ( cluster_population(l) == 0 )
      j = 1 + floor ( point_num * rand ( ) );
      cluster_center(1:dim_num) = point(1:dim_num,j)
    else
      cluster_center(1:dim_num,l) = cluster_center(1:dim_num,l) ...
        / cluster_population(l);
    end
%
%  Initialize AN1, AN2, ITRAN and NCP
%  AN1(L) = CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) - 1)
%  AN2(L) = CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) + 1)
%  ITRAN(L) = 1 if cluster L is updated in the quick-transfer stage,
%           = 0 otherwise
%  In the optimal-transfer stage, NCP(L) stores the step at which
%  cluster L is last updated.
%  In the quick-transfer stage, NCP(L) stores the step at which
%  cluster L is last updated plus POINT_NUM.
%
    an2(l) = cluster_population(l) / ( cluster_population(l) + 1 );

    if ( 1 < cluster_population(l) )
      an1(l) = cluster_population(l) / ( cluster_population(l) - 1 );
    else
      an1(l) = Inf;
    end

    itran(l) = 1;
    ncp(l) = -1;

  end

  indx = 0;
  ifault = 2;
  it_num = 0;

  d = zeros(point_num);
  live = zeros(cluster_num);

  while ( it_num < it_max )

    it_num = it_num + 1;
%
%  In this stage, there is only one pass through the data.   Each
%  point is re-allocated, if necessary, to the cluster that will
%  induce the maximum reduction in within-cluster sum of squares.
%
    [ cluster_center, cluster, cluster2, cluster_population, an1, an2, ...
      ncp, d, itran, live, indx ] = kmeans_02_optra ( dim_num, point_num, ...
      cluster_num, point, cluster_center, cluster, cluster2, cluster_population, ...
      an1, an2, ncp, d, itran, live, indx );
%
%  Stop if no transfer took place in the last POINT_NUM optimal transfer steps.
%
    if ( indx == point_num )
      ifault = 0;
      break
    end
%
%  Each point is tested in turn to see if it should be re-allocated
%  to the cluster to which it is most likely to be transferred,
%  CLUSTER2(I), from its present cluster, CLUSTER(I).   Loop through the
%  data until no further change is to take place.
%
    [ cluster_center, cluster, cluster2, cluster_population, an1, ...
      an2, ncp, d, itran, indx ] = kmeans_02_qtran ( dim_num, point_num, ...
      cluster_num, point, cluster_center, cluster, cluster2, cluster_population, ...
      an1, an2, ncp, d, itran, indx );
%
%  If there are only two clusters, there is no need to re-enter the
%  optimal transfer stage.
%
    if ( cluster_num == 2 )
      ifault = 0;
      break
    end
%
%  NCP has to be set to 0 before entering OPTRA.
%
    ncp(1:cluster_num) = 0;

  end

  if ( ifault == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMEANS_02 - Warning!\n' );
    fprintf ( 1, '  Maximum number of iterations reached\n' );
    fprintf ( 1, '  without convergence.\n' );
  end
%
%  Compute the within-cluster sum of squares for each cluster.
%
  cluster_center(1:dim_num,1:cluster_num) = 0.0;

  for i = 1 : point_num
    cluster_center(1:dim_num,cluster(i)) = ...
      cluster_center(1:dim_num,cluster(i)) + point(1:dim_num,i);
  end

  for j = 1 : dim_num
    cluster_center(j,1:cluster_num) = cluster_center(j,1:cluster_num) ...
      ./ cluster_population(1:cluster_num);
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
function [ cluster_center, cluster, cluster2, cluster_population, an1, an2, ...
  ncp, d, itran, live, indx ] = kmeans_02_optra ( dim_num, point_num, ...
  cluster_num, point, cluster_center, cluster, cluster2, cluster_population, ...
  an1, an2, ncp, d, itran, live, indx )

%*****************************************************************************80
%
%% KMEANS_02_OPTRA carries out the optimal transfer stage.
%
%  Discussion:
%
%    Each point is re-allocated, if necessary, to the cluster that
%    will induce a maximum reduction in the within-cluster sum of
%    squares.
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
%    Original FORTRAN77 by John Hartigan, Manchek Wong.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    John Hartigan, Manchek Wong,
%    Algorithm AS 136:
%    A K-Means Clustering Algorithm,
%    Applied Statistics,
%    Volume 28, Number 1, 1979, pages 100-108.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, real POINT(DIM_NUM,POINT_NUM), the coordinates of 
%    the points.
%
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Input, integer CLUSTER(POINT_NUM), the cluster 
%    each point belongs to.
%
%    Input, integer CLUSTER2(POINT_NUM), the cluster 
%    to which each point is most likely to be transferred to.
%
%    Input, integer CLUSTER_POPULATION(CLUSTER_NUM), 
%    the number of points in each cluster.
%
%    Input, real AN1(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) - 1)
%
%    Input, real AN2(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) + 1)
%
%    Input, integer NCP(CLUSTER_NUM), ?
%
%    Input, real D(POINT_NUM), ?
%
%    Input, integer ITRAN(CLUSTER_NUM), 
%    1 if cluster L is updated in the quick-transfer stage,
%    0 otherwise.  Reset to 0 on output.
%
%    Input, integer LIVE(CLUSTER_NUM), ?
%
%    Input, integer INDX, ?
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER(POINT_NUM), the cluster 
%    each point belongs to.
%
%    Output, integer CLUSTER2(POINT_NUM), the cluster 
%    to which each point is most likely to be transferred to.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), 
%    the number of points in each cluster.
%
%    Output, real AN1(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) - 1)
%
%    Output, real AN2(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) + 1)
%
%    Output, integer NCP(CLUSTER_NUM), ?
%
%    Output, real D(POINT_NUM), ?
%
%    Output, integer ITRAN(CLUSTER_NUM), 
%    1 if cluster L is updated in the quick-transfer stage,
%    0 otherwise.  Reset to 0 on output.
%
%    Output, integer LIVE(CLUSTER_NUM), ?
%
%    Output, integer INDX, ?
%

%
%  If cluster L is updated in the last quick-transfer stage, it
%  belongs to the live set throughout this stage.   Otherwise, at
%  each step, it is not in the live set if it has not been updated
%  in the last POINT_NUM optimal transfer steps.
%
  for l = 1 : cluster_num
    if ( itran(l) == 1 )
      live(l) = point_num + 1;
    end
  end

  for i = 1 : point_num

    indx = indx + 1;
    l1 = cluster(i);
    l2 = cluster2(i);
    ll = l2;
%
%  If point I is the only member of cluster L1, no transfer.
%
    if ( 1 < cluster_population(l1) )
%
%  If L1 has been updated in this stage, re-compute D(I).
%
      if ( ncp(l1) ~= 0 )
        d(i) = an1(l1) * sum ( ...
          ( point(1:dim_num,i) - cluster_center(1:dim_num,l1) ).^2 );
      end
%
%  Find the cluster with minimum R2.
%
      r2 = an2(l2) * sum ( ...
        ( point(1:dim_num,i) - cluster_center(1:dim_num,l2) ).^2 );

      for l = 1 : cluster_num
%
%  If LIVE(L1) <= I, then L1 is not in the live set.   If this is
%  true, we only need to consider clusters that are in the live set
%  for possible transfer of point I.   
%
%  Otherwise, we need to consider all possible clusters.
%
        if ( ( i < live(l1) | i < live(l) ) & ...
             l ~= l1 & ...
             l ~= ll )

          rr = r2 / an2(l);

          dc = sum ( ( point(1:dim_num,i) - cluster_center(1:dim_num,l) ).^2 );

          if ( dc < rr )
            r2 = dc * an2(l);
            l2 = l;
          end

        end

      end
%
%  If no transfer is necessary, L2 is the new CLUSTER2(I).
% 
      if ( d(i) <= r2 )

        cluster2(i) = l2;

      else
%
%  Update cluster centers, LIVE, NCP, AN1 and AN2 for clusters L1 and
%  L2, and update CLUSTER(I) and CLUSTER2(I).
%
        indx = 0;
        live(l1) = point_num + i;
        live(l2) = point_num + i;
        ncp(l1) = i;
        ncp(l2) = i;
        al1 = cluster_population(l1);
        alw = al1 - 1.0;
        al2 = cluster_population(l2);
        alt = al2 + 1.0;

        cluster_center(1:dim_num,l1) = ( cluster_center(1:dim_num,l1) * al1 ...
          - point(1:dim_num,i) ) / alw;

        cluster_center(1:dim_num,l2) = ( cluster_center(1:dim_num,l2) * al2 ...
          + point(1:dim_num,i) ) / alt;

        cluster_population(l1) = cluster_population(l1) - 1;
        cluster_population(l2) = cluster_population(l2) + 1;
        an2(l1) = alw / al1;

        if ( 1.0 < alw )
          an1(l1) = alw / ( alw - 1.0 );
        else
          an1(l1) = Inf;
        end

        an1(l2) = alt / al2;
        an2(l2) = alt / ( alt + 1.0 );
        cluster(i) = l2;
        cluster2(i) = l1;

      end

    end

    if ( indx == point_num )
      return
    end

  end
%
%  ITRAN(L) = 0 before entering QTRAN.
%
  itran(1:cluster_num) = 0;
%
%  LIVE(L) has to be decreased by POINT_NUM before re-entering OPTRA.
%
  live(1:cluster_num) = live(1:cluster_num) - point_num;

  return
end
function [ cluster_center, cluster, cluster2, cluster_population, an1, ...
  an2, ncp, d, itran, indx ] = kmeans_02_qtran ( dim_num, point_num, ...
  cluster_num, point, cluster_center, cluster, cluster2, cluster_population, ...
  an1, an2, ncp, d, itran, indx )

%*****************************************************************************80
%
%% KMEANS_02_QTRAN carries out the quick transfer stage.
%
%  Discussion:
%
%    For each point I, CLUSTER(I) and CLUSTER2(I) are switched, if necessary, 
%    to reduce within-cluster sum of squares.  The cluster centers are
%    updated after each step.
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
%    Original FORTRAN77 by John Hartigan, Manchek Wong.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    John Hartigan, Manchek Wong,
%    Algorithm AS 136:
%    A K-Means Clustering Algorithm,
%    Applied Statistics,
%    Volume 28, Number 1, 1979, pages 100-108.
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
%    Input, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Input, integer CLUSTER(POINT_NUM), the cluster 
%    each point belongs to.
%
%    Input, integer CLUSTER2(POINT_NUM), the cluster to which
%    each point is most likely to be transferred to.
%
%    Input, integer CLUSTER_POPULATION(CLUSTER_NUM), 
%    the number of points in each cluster.
%
%    Input, real AN1(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) - 1)
%
%    Input, real AN2(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) + 1)
%
%    Input, integer NCP(CLUSTER_NUM), ?
%
%    Input, real D(POINT_NUM), ?
%
%    Input, integer ITRAN(CLUSTER_NUM), 
%    1 if cluster L is updated in the quick-transfer stage,
%    0 otherwise.
%
%    Input, integer INDX, is set to 0 if any updating occurs.
%
%    Output, real CLUSTER_CENTER(DIM_NUM,CLUSTER_NUM),
%    the cluster centers.
%
%    Output, integer CLUSTER(POINT_NUM), the cluster 
%    each point belongs to.
%
%    Output, integer CLUSTER2(POINT_NUM), the cluster to which
%    each point is most likely to be transferred to.
%
%    Output, integer CLUSTER_POPULATION(CLUSTER_NUM), 
%    the number of points in each cluster.
%
%    Output, real AN1(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) - 1)
%
%    Output, real AN2(CLUSTER_NUM), 
%    CLUSTER_POPULATION(L) / (CLUSTER_POPULATION(L) + 1)
%
%    Output, integer NCP(CLUSTER_NUM), ?
%
%    Output, real D(POINT_NUM), ?
%
%    Output, integer ITRAN(CLUSTER_NUM), 
%    1 if cluster L is updated in the quick-transfer stage,
%    0 otherwise.
%
%    Output, integer INDX, is set to 0 if any updating occurs.
%

%
%  In the optimal transfer stage, NCP(L) indicates the step at which
%  cluster L is last updated.   In the quick transfer stage, NCP(L)
%  is equal to the step at which cluster L is last updated plus POINT_NUM.
%
  count = 0;
  step = 0;

  while ( 1 )

    for i = 1 : point_num

      count = count + 1;
      step = step + 1;
      l1 = cluster(i);
      l2 = cluster2(i);
%
%  If point I is the only member of cluster L1, no transfer.
%
      if ( 1 < cluster_population(l1) )
%
%  If NCP(L1) < STEP, no need to re-compute distance from point I to
%  cluster L1.   Note that if cluster L1 is last updated exactly POINT_NUM
%  steps ago, we still need to compute the distance from point I to
%  cluster L1.
%
        if ( step <= ncp(l1) )
          d(i) = an1(l1) * sum ( ...
            ( point(1:dim_num,i) - cluster_center(1:dim_num,l1) ).^2 );
        end
%
%  If STEP >= both NCP(L1) and NCP(L2) there will be no transfer of
%  point I at this step.
%
        if ( step < ncp(l1) | step < ncp(l2) )

          r2 = d(i) / an2(l2);

          dd = sum ( ( point(1:dim_num,i) - cluster_center(1:dim_num,l2) ).^2 );
%
%  Update cluster centers, NCP, CLUSTER_POPULATION, ITRAN, AN1 and AN2 
%  for clusters L1 and L2.   Also update CLUSTER(I) and CLUSTER2(I).   
%
%  Note that if any updating occurs in this stage, INDX is set back to 0.
%
          if ( dd < r2 )

            count = 0;
            indx = 0;
            itran(l1) = 1;
            itran(l2) = 1;
            ncp(l1) = step + point_num;
            ncp(l2) = step + point_num;
            al1 = cluster_population(l1);
            alw = al1 - 1.0;
            al2 = cluster_population(l2);
            alt = al2 + 1.0;

            cluster_center(1:dim_num,l1) = ...
              ( cluster_center(1:dim_num,l1) * al1 ...
              - point(1:dim_num,i) ) / alw;

            cluster_center(1:dim_num,l2) = ...
              ( cluster_center(1:dim_num,l2) * al2 ...
              + point(1:dim_num,i) ) / alt;

            cluster_population(l1) = cluster_population(l1) - 1;
            cluster_population(l2) = cluster_population(l2) + 1;
            an2(l1) = alw / al1;

            if ( 1.0 < alw )
              an1(l1) = alw / ( alw - 1.0 );
            else
              an1(l1) = Inf;
            end

            an1(l2) = alt / al2;
            an2(l2) = alt / ( alt + 1.0 );
            cluster(i) = l2;
            cluster2(i) = l1;

          end

        end

      end
%
%  If no re-allocation took place in the last POINT_NUM steps, return.
%
      if ( count == point_num )
        return
      end

    end

  end

  return
end
