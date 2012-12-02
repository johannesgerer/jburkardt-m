function [ c, ic1, nc, wss, ifault ] = kmns ( a, m, n, c, k, iter )

%*****************************************************************************80
%
%% KMNS carries out the K-means algorithm.
%
%  Discussion:
%
%    This routine attempts to divide M points in N-dimensional space into
%    K clusters so that the within cluster sum of squares is minimized.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2008
%
%  Author:
%
%    Oiginal FORTRAN77 version by John Hartigan, Manchek Wong.
%    MATLAB version by John Burkardt.
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
%    Input, real A(M,N), the points.
%
%    Input, integer M, the number of points.
%
%    Input, integer N, the number of spatial dimensions.
%
%    Input, real C(K,N), the initial cluster centers.
%
%    Input, integer K, the number of clusters.
%
%    Input, integer ITER, the maximum number of iterations allowed.
%
%    Output, real C(K,N), the final cluster centers.
%
%    Output, integer IC1(M), the cluster to which each point
%    is assigned.
%
%    Output, integer NC(K), the number of points in each cluster.
%
%    Output, real WSS(K), the within-cluster sum of squares
%    of each cluster.
%
%    Output, integer IFAULT, error indicator.
%    0, no error was detected.
%    1, at least one cluster is empty after the initial assignment.  A better
%       set of initial cluster centers is needed.
%    2, the allowed maximum number off iterations was exceeded.
%    3, K is less than or equal to 1, or greater than or equal to M.
%
  ifault = 0;
  ic1 = [];
  nc = [];
  wss = [];


  if ( k <= 1 | m <= k )
    ifault = 3;
    return
  end
%
%  For each point I, find its two closest centers, IC1(I) and
%  IC2(I).  Assign the point to IC1(I).
%
  for i = 1 : m

    ic1(i) = 1;
    ic2(i) = 2;

    for il = 1 : 2
      dt(il) = 0.0;
      for j = 1 : n
        da = a(i,j) - c(il,j);
        dt(il) = dt(il) + da * da;
      end
    end

    if ( dt(2) < dt(1) )
      ic1(i) = 2;
      ic2(i) = 1;
      temp = dt(1);
      dt(1) = dt(2);
      dt(2) = temp;
    end

    for l = 3 : k

      db = 0.0;
      for j = 1 : n
        dc = a(i,j) - c(l,j);
        db = db + dc * dc;
      end

      if ( db < dt(2) )

        if ( dt(1) <= db )
          dt(2) = db;
          ic2(i) = l;
        else
          dt(2) = dt(1);
          ic2(i) = ic1(i);
          dt(1) = db;
          ic1(i) = l;
        end

      end

    end

  end
%
%  Update cluster centers to be the average of points contained within them.
%
  for l = 1 : k
    nc(l) = 0;
    for j = 1 : n
      c(l,j) = 0.0;
    end
  end

  for i = 1 : m
    l = ic1(i);
    nc(l) = nc(l) + 1;
    for j = 1 : n
      c(l,j) = c(l,j) + a(i,j);
    end
  end
%
%  Check to see if there is any empty cluster at this stage.
%
  ifault = 1;

  for l = 1 : k

    if ( nc(l) == 0 )
      ifault = 1;
      return
    end

  end

  ifault = 0;

  for l = 1 : k

    aa = nc(l);

    for j = 1 : n
      c(l,j) = c(l,j) / aa;
    end
%
%  Initialize AN1, AN2, ITRAN and NCP.
%
%  AN1(L) = NC(L) / (NC(L) - 1)
%  AN2(L) = NC(L) / (NC(L) + 1)
%  ITRAN(L) = 1 if cluster L is updated in the quick-transfer stage,
%           = 0 otherwise
%
%  In the optimal-transfer stage, NCP(L) stores the step at which
%  cluster L is last updated.
%
%  In the quick-transfer stage, NCP(L) stores the step at which
%  cluster L is last updated plus M.
%
    an2(l) = aa / ( aa + 1.0 );

    if ( 1.0 < aa )
      an1(l) = aa / ( aa - 1.0 );
    else
      an1(l) = Inf;
    end

    itran(l) = 1;
    ncp(l) = -1;

  end

  indx = 0;
  d(1:m) = 0.0;
  live(1:k) = 0;
  ifault = 2;

  for ij = 1 : iter
%
%  In this stage, there is only one pass through the data.   Each
%  point is re-allocated, if necessary, to the cluster that will
%  induce the maximum reduction in within-cluster sum of squares.
%
  [ c, ic1, ic2, nc, an1, an2, ncp, d, itran, live, indx ] = ...
    optra ( a, m, n, c, k, ic1, ic2, nc, an1, an2, ncp, d, itran, live, indx );
%
%  Stop if no transfer took place in the last M optimal transfer steps.
%
    if ( indx == m )
      ifault = 0;
      break
    end
%
%  Each point is tested in turn to see if it should be re-allocated
%  to the cluster to which it is most likely to be transferred,
%  IC2(I), from its present cluster, IC1(I).   Loop through the
%  data until no further change is to take place.
%
  [ c, ic1,ic2, nc, an1, an2, ncp, d, itran, indx ] = qtran ( a, m, ...
    n, c, k, ic1, ic2, nc, an1, an2, ncp, d, itran, indx );
%
%  If there are only two clusters, there is no need to re-enter the
%  optimal transfer stage.
%
    if ( k == 2 )
      ifault = 0;
      break
    end
%
%  NCP has to be set to 0 before entering OPTRA.
%
    for l = 1 : k
      ncp(l) = 0;
    end

  end
%
%  If the maximum number of iterations was taken without convergence,
%  IFAULT is 2 now.  This may indicate unforeseen looping.
%
  if ( ifault == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KMNS - Warning!\n' );
    fprintf ( 1, '  Maximum number of iterations reached\n' );
    fprintf ( 1, '  without convergence.\n' );
  end
%
%  Compute the within-cluster sum of squares for each cluster.
%
  for l = 1 : k
    wss(l) = 0.0;
    for j = 1 : n
      c(l,j) = 0.0;
    end
  end

  for i = 1 : m
    ii = ic1(i);
    for j = 1 : n
      c(ii,j) = c(ii,j) + a(i,j);
    end
  end

  for j = 1 : n
    for l = 1 : k
      c(l,j) = c(l,j) / nc(l);
    end
    for i = 1 : m
      ii = ic1(i);
      da = a(i,j) - c(ii,j);
      wss(ii) = wss(ii) + da * da;
    end
  end

  return
end
