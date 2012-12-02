function [ d, dev, b, e ] = clustr ( x, d, i, j, n, nz, k )

%*****************************************************************************80
%
%% CLUSTR uses the K-means algorithm to cluster data.
%
%  Discussion:
%
%    Given a matrix of I observations on J variables, the
%    observations are allocated to N clusters in such a way that the
%    within-cluster sum of squares is minimised.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by David Sparks.
%    MATLAB version by John Burkardt.
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
%    Input, real X(I,J), the observed data.
%
%    Input, real D(K,J), the initial cluster centers.
%
%    Input, integer I, the number of observations.
%
%    Input, integer J, the number of variables.
%
%    Input, integer N, the number of clusters.
%
%    Input, integer NZ, the minimum number of observations
%    which any cluster is allowed to have.
%
%    Input, integer K, the maximum number of clusters.
%
%    Output, real D(K,J), the updated cluster centers.
%
%    Output, real DEV(K), the sums of squared deviations
%    of observations from their cluster centers.
%
%    Output, Integer B(I), indicates the cluster to which
%    each observation has been assigned.
%
%    Output, integer E(K), the number of observations assigned
%    to each cluster.
%
  for ia = 1 : n
    e(ia) = 0;
  end
%
%  For each observation, calculate the distance from each cluster
%  center, and assign to the nearest.
%
  for ic = 1 : i

    f(ic) = 0.0;
    da = Inf;

    for id = 1 : n

      db = 0.0;
      for ie = 1 : j
        dc = x(ic,ie) - d(id,ie);
        db = db + dc * dc;
      end

      if ( db < da )
        da = db;
        b(ic) = id;
      end

    end

    ig = b(ic);
    e(ig) = e(ig) + 1;

  end
%
%  Calculate the mean and sum of squares for each cluster.
%
  for ix = 1 : n
    dev(ix) = 0.0;
    for iy = 1 : j
      d(ix,iy) = 0.0;
    end
  end

  for ic = 1 : i
    ig = b(ic);
    for ih = 1 : j
      d(ig,ih) = d(ig,ih) + x(ic,ih);
    end
  end

  for ij = 1 : j
    for ii = 1 : n
      d(ii,ij) = d(ii,ij) / e(ii);
    end
  end

  for ij = 1 : j
    for ik = 1 : i
      il = b(ik);
      da = x(ik,ij) - d(il,ij);
      db = da * da;
      f(ik) = f(ik) + db;
      dev(il) = dev(il) + db;
    end
  end

  for ik = 1 : i
    il = b(ik);
    fl = e(il);
    if ( 2.0 <= fl )
      f(ik) = f(ik) * fl / ( fl - 1.0 );
    end
  end
%
%  Examine each observation in turn to see if it should be
%  reassigned to a different cluster.
%
  while ( 1 )

    iw = 0;

    for ik = 1 : i

      il = b(ik);
      ir = il;
%
%  If the number of cluster points is less than or equal to the
%  specified minimum, NZ, then bypass this iteration.
%
      if ( nz < e(il) )

        fl = e(il);
        dc = f(ik);

        for in = 1 : n

          if ( in ~= il )

            fm = e(in);
            fm = fm / ( fm + 1.0 );

            de = 0.0;
            for ip = 1 : j
              da = x(ik,ip) - d(in,ip);
              de = de + da * da * fm;
            end

            if ( de < dc )
              dc = de;
              ir = in;
            end

          end

        end
%
%  Reassignment is made here if necessary.
%
        if ( ir ~= il )

          fq = e(ir);
          dev(il) = dev(il) - f(ik);
          dev(ir) = dev(ir) + dc;
          e(ir) = e(ir) + 1;
          e(il) = e(il) - 1;

          for is = 1 : j
            d(il,is) = ( d(il,is) * fl - x(ik,is) ) / ( fl - 1.0 );
            d(ir,is) = ( d(ir,is) * fq + x(ik,is) ) / ( fq + 1.0 );
          end

          b(ik) = ir;

          for it = 1 : i

            ij = b(it);

            if ( ij == il | ij == ir )
              f(it) = 0.0;
              for iu = 1 : j
                da = x(it,iu) - d(ij,iu);
                f(it) = f(it) + da * da;
              end
              fl = e(ij);
              f(it) = f(it) * fl / ( fl - 1.0 );
            end

          end

          iw = iw + 1;

        end

      end

    end
%
%  If any reassignments were made on this pass, then do another pass.
%
    if ( iw == 0 )
      break
    end

  end

  return
end
