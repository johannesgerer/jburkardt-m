function [ c, ic1, ic2, nc, an1, an2, ncp, d, itran, live, indx ] = ...
  optra ( a, m, n, c, k, ic1, ic2, nc, an1, an2, ncp, d, itran, live, indx )

%*****************************************************************************80
%
%% OPTRA carries out the optimal transfer stage.
%
%  Discussion:
%
%    This is the optimal transfer stage.
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
%    Input/output, integer LIVE(K).
%
%    Input/output, integer INDX, the number of steps since a
%    transfer took place.
%

%
%  If cluster L is updated in the last quick-transfer stage, it
%  belongs to the live set throughout this stage.   Otherwise, at
%  each step, it is not in the live set if it has not been updated
%  in the last M optimal transfer steps.
%
  for l = 1 : k
    if ( itran(l) == 1)
      live(l) = m + 1;
    end
  end

  for i = 1 : m

    indx = indx + 1;
    l1 = ic1(i);
    l2 = ic2(i);
    ll = l2;
%
%  If point I is the only member of cluster L1, no transfer.
%
    if ( 1 < nc(l1)  )
%
%  If L1 has not yet been updated in this stage, no need to
%  re-compute D(I).
%
      if ( ncp(l1) ~= 0 )
        de = 0.0;
        for j = 1 : n
          df = a(i,j) - c(l1,j);
          de = de + df * df;
        end
        d(i) = de * an1(l1);
      end
%
%  Find the cluster with minimum R2.
%
     da = 0.0;
      for j = 1 : n
        db = a(i,j) - c(l2,j);
        da = da + db * db;
      end
      r2 = da * an2(l2);

      for l = 1 : k
%
%  If LIVE(L1) <= I, then L1 is not in the live set.   If this is
%  true, we only need to consider clusters that are in the live set
%  for possible transfer of point I.   Otherwise, we need to consider
%  all possible clusters.
%
        if ( ( i < live(l1) | i < live(l2) ) & l ~= l1 & l ~= ll )

          rr = r2 / an2(l);

          dc = 0.0;
          for j = 1 : n
            dd = a(i,j) - c(l,j);
            dc = dc + dd * dd;
          end

          if ( dc < rr )
            r2 = dc * an2(l);
            l2 = l;
          end

        end

      end
%
%  If no transfer is necessary, L2 is the new IC2(I).
%
      if ( d(i) <= r2 )

        ic2(i) = l2;
%
%  Update cluster centers, LIVE, NCP, AN1 and AN2 for clusters L1 and
%  L2, and update IC1(I) and IC2(I).
%
      else

        indx = 0;
        live(l1) = m + i;
        live(l2) = m + i;
        ncp(l1) = i;
        ncp(l2) = i;
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

    if ( indx == m )
      return
    end

  end
%
%  ITRAN(L) = 0 before entering QTRAN.   Also, LIVE(L) has to be
%  decreased by M before re-entering OPTRA.
%
  for l = 1 : k
    itran(l) = 0;
    live(l) = live(l) - m;
  end

  return
end
