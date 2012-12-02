function [ c, ic1,ic2, nc, an1, an2, ncp, d, itran, indx ] = qtran ( a, m, ...
  n, c, k, ic1, ic2, nc, an1, an2, ncp, d, itran, indx )

%*****************************************************************************80
%
%% QTRAN carries out the quick transfer stage.
%
%  Discussion:
%
%    This is the quick transfer stage.
%
%    IC1(I) is the cluster which point I belongs to.
%    IC2(I) is the cluster which point I is most likely to be
%    transferred to.
%
%    For each point I, IC1(I) and IC2(I) are switched, if necessary, to
%    reduce within-cluster sum of squares.  The cluster centers are
%    updated after each step.
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
%    Original FORTRAN77 version by John Hartigan, Manchek Wong.
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
%    Input/output, real C(K,N), the cluster centers.
%
%    Input, integer K, the number of clusters.
%
%    Input/output, integer IC1(M), the cluster to which each
%    point is assigned.
%
%    Input/output, integer IC2(M), used to store the cluster
%    which each point is most likely to be transferred to at each step.
%
%    Input/output, integer NC(K), the number of points in
%    each cluster.
%
%    Input/output, real AN1(K).
%
%    Input/output, real AN2(K).
%
%    Input/output, integer NCP(K).
%
%    Input/output, real D(M).
%
%    Input/output, integer ITRAN(K).
%
%    Input/output, integer INDX, counts the number of steps
%    since the last transfer.
%

%
%  In the optimal transfer stage, NCP(L) indicates the step at which
%  cluster L is last updated.   In the quick transfer stage, NCP(L)
%  is equal to the step at which cluster L is last updated plus M.
%
  icoun = 0;
  istep = 0;

  while ( 1 )

    for i = 1 : m

      icoun = icoun + 1;
      istep = istep + 1;
      l1 = ic1(i);
      l2 = ic2(i);
%
%  If point I is the only member of cluster L1, no transfer.
%
      if ( 1 < nc(l1) )
%
%  If NCP(L1) < ISTEP, no need to re-compute distance from point I to
%  cluster L1.   Note that if cluster L1 is last updated exactly M
%  steps ago, we still need to compute the distance from point I to
%  cluster L1.
%
        if ( istep <= ncp(l1) )

          da = 0.0;
          for j = 1 : n
            db = a(i,j) - c(l1,j);
            da = da + db * db;
          end

          d(i) = da * an1(l1);

        end
%
%  If NCP(L1) <= ISTEP and NCP(L2) <= ISTEP, there will be no transfer of
%  point I at this step.
%
        if ( istep < ncp(l1) | istep < ncp(l2) )

          r2 = d(i) / an2(l2);

          dd = 0.0;
          for j = 1 : n
            de = a(i,j) - c(l2,j);
            dd = dd + de * de;
          end
%
%  Update cluster centers, NCP, NC, ITRAN, AN1 and AN2 for clusters
%  L1 and L2.   Also update IC1(I) and IC2(I).   Note that if any
%  updating occurs in this stage, INDX is set back to 0.
%
          if ( dd < r2 )

            icoun = 0;
            indx = 0;
            itran(l1) = 1;
            itran(l2) = 1;
            ncp(l1) = istep + m;
            ncp(l2) = istep + m;
            al1 = nc(l1);
            alw = al1 - 1.0;
            al2 = nc(l2);
            alt = al2 + 1.0;
            for j = 1 : n
              c(l1,j) = ( c(l1,j) * al1 - a(i,j) ) / alw;
              c(l2,j) = ( c(l2,j) * al2 + a(i,j) ) / alt;
            end
            nc(l1) = nc(l1) - 1;
            nc(l2) = nc(l2) + 1;
            an2(l1) = alw / al1;
            if ( 1.0 < alw )
              an1(l1) = alw / ( alw - 1.0 );
            else
              an1(l1) = Inf;
            end
            an1(l2) = alt / al2;
            an2(l2) = alt / ( alt + 1.0 );
            ic1(i) = l2;
            ic2(i) = l1;

          end

        end

      end
%
%  If no re-allocation took place in the last M steps, return.
%
      if ( icoun == m )
        return
      end

    end

  end

  return
end
