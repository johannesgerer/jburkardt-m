function [ ap, det, inert ] = sspdi ( ap, n, kpvt, job )

%*****************************************************************************80
%
%% SSPDI computes the determinant, inertia and inverse of a real symmetric matrix.
%
%  Discussion:
%
%    SSPDI uses the factors from SSPFA, where the matrix is stored in 
%    packed form.
%
%    A division by zero will occur if the inverse is requested
%    and SSPCO has set RCOND == 0.0 or SSPFA has set INFO /= 0.
%
%    Variables not requested by JOB are not used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real AP(N*(N+1)/2), the output from SSPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer KPVT(N), the pivot vector from SSPFA.
%
%    Input, integer JOB, has the decimal expansion ABC where:
%      if A /= 0, the inertia is computed,
%      if B /= 0, the determinant is computed,
%      if C /= 0, the inverse is computed.
%    For example, JOB = 111  gives all three.
%
%    Output, real AP(N*(N+1)/2), the upper triangle of the inverse of the original
%    matrix, stored in packed form, if requested.  The columns of the upper
%    triangle are stored sequentially in a one-dimensional array.
%
%    Output, real DET(2), the determinant of the original matrix,
%    if requested.
%      determinant = DET(1) * 10.0**DET(2)
%    with 1.0 <= abs ( DET(1) ) < 10.0 or DET(1) = 0.0.
%
%    Output, integer INERT(3), the inertia of the original matrix,
%    if requested.
%    INERT(1) = number of positive eigenvalues.
%    INERT(2) = number of negative eigenvalues.
%    INERT(3) = number of zero eigenvalues.
%
  ten = 10.0;

  doinv =         mod ( job,   10 )       ) ~= 0;
  dodet = floor ( mod ( job,  100 ) /  10 ) ~= 0;
  doert = floor ( mod ( job, 1000 ) / 100 ) ~= 0;

  inert(1:3) = 0;
  det(1:2) = [ 1.0, 0.0 ];

  if ( dodet | doert )

    t = 0.0;
    ik = 0;

    for k = 1 : n

      kk = ik + k;
      d = ap(kk);
%
%  2 by 2 block
%  use det (d  s)  =  (d/t * c - t) * t,  t = abs ( s )
%          (s  c)
%  to avoid underflow/overflow troubles.
%
%  Take two passes through scaling.  Use T for flag.
%
      if ( kpvt(k) <= 0 )

        if ( t == 0.0 )
          ikp1 = ik + k;
          kkp1 = ikp1 + k;
          t = abs ( ap(kkp1) );
          d = ( d / t ) * ap(kkp1+1) - t;
        else
          d = t;
          t = 0.0;
        end

      end

      if ( doert )
        if ( 0.0 < d )
          inert(1) = inert(1) + 1;
        else if ( d < 0.0 )
          inert(2) = inert(2) + 1;
        else if ( d == 0.0 )
          inert(3) = inert(3) + 1;
        end
      end

      if ( dodet )

        det(1) = d * det(1);

        if ( det(1) ~= 0.0 )

          while ( abs ( det(1) ) < 1.0 )
            det(1) = ten * det(1);
            det(2) = det(2) - 1.0;
          end

          while ( ten <= abs ( det(1) ) )
            det(1) = det(1) / ten;
            det(2) = det(2) + 1.0;
          end

        end

      end

      ik = ik + k;

    end

  end
%
%  Compute inverse(A).
%
  if ( doinv )

    k = 1;
    ik = 0;

    while ( k <= n ) 

      km1 = k - 1;
      kk = ik + k;
      ikp1 = ik + k;
      kkp1 = ikp1 + k;

      if ( 0 <= kpvt(k) )
%
%  1 by 1.
%
        ap(kk) = 1.0 / ap(kk);

        if ( 2 <= k )

          work(1:k-1) = ap(ik+1:ik+k-1);
          ij = 0;

          for j = 1 : k-1
            jk = ik + j;
            ap(jk) = sdot ( j, ap(ij+1:ij+j), 1, work(1:j), 1 );
            ap(ik+1:ik+j-1) = ...
              saxpy ( j-1, work(j), ap(ij+1:ij+j-1), 1, ap(ik+1:ik+j-1), 1 );
            ij = ij + j;
          end

          ap(kk) = ap(kk) + sdot ( k-1, work(1:k-1), 1, ap(ik+1:ik+k-1), 1 );

        end

        kstep = 1;

      else
%
%  2 by 2.
%
        t = abs ( ap(kkp1) );
        ak = ap(kk) / t;
        akp1 = ap(kkp1+1) / t;
        akkp1 = ap(kkp1) / t;
        d = t * ( ak * akp1 - 1.0 );
        ap(kk) = akp1 / d;
        ap(kkp1+1) = ak / d;
        ap(kkp1) = -akkp1 / d;

        if ( 1 <= km1 )

          work(1:km1) = ap(ikp1+1:ikp1+km1);
          ij = 0;

          for j = 1 : km1
            jkp1 = ikp1 + j;
            ap(jkp1) = sdot ( j, ap(ij+1:ij+j), 1, work(1:j), 1 );
            ap(ikp1+1:ikp1+j-1) = ...
              saxpy ( j-1, work(j), ap(ij+1:ij+j-1), 1, ap(ikp1+1:ikp1+j-1), 1 );
            ij = ij + j;
          end

          ap(kkp1+1) = ap(kkp1+1) + sdot ( km1, work(1:km1), 1, ap(ikp1+1:ikp1+km1)), 1 );
          ap(kkp1) = ap(kkp1) + sdot ( km1, ap(ik+1:ik+km1), 1, ap(ikp1+1:ikp1+km1), 1 );
          work(1:km1) = ap(ik+1:ik+km1);
          ij = 0;

          for j = 1 : km1
            jk = ik + j;
            ap(jk) = sdot ( j, ap(ij+1:ij+j), 1, work(1:j), 1 );
            call saxpy ( j-1, work(j), ap(ij+1:ij+j-1), 1, ap(ik+1:ik+j-1), 1 );
            ij = ij + j;
          end

          ap(kk) = ap(kk) + sdot ( km1, work(1:km1), 1, ap(ik+1:ik+km1), 1 );

        end

        kstep = 2;
  
      end
%
%  Swap.
%
      ks = abs ( kpvt(k) )

      if ( ks ~= k )

        iks = floor ( ( ks * ( ks - 1 ) ) / 2 );

        temp(1:ks) = ap(iks+1:iks+ks);
        ap(iks+1:iks+ks) = ap(ik+1:ik+ks);
        ap(ik+1:ik+ks) = temp(1:ks);

        ksj = ik + ks;

        for jb = ks : k
          j = k + ks - jb;
          jk = ik + j;
          temp = ap(jk);
          ap(jk) = ap(ksj);
          ap(ksj) = temp;
          ksj = ksj - ( j - 1 );
        end

        if ( kstep ~= 1 )
          kskp1 = ikp1 + ks;
          temp = ap(kskp1);
          ap(kskp1) = ap(kkp1);
          ap(kkp1) = temp;
        end

      end

      ik = ik + k;
      if ( kstep == 2 )
        ik = ik + k + 1;
      end

      k = k + kstep;

    end

  end

  return
end
