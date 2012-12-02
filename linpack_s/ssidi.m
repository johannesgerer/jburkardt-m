function [ a, det, inert ] = ssidi ( a, lda, n, kpvt, job )

%*****************************************************************************80
%
%% SSIDI computes the determinant, inertia and inverse of a symmetric matrix.
%
%  Discussion:
%
%    SSIDI uses the factors from SSIFA.
%
%    A division by zero may occur if the inverse is requested
%    and SSICO has set RCOND == 0.0D+00 or SSIFA has set INFO /= 0.
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
%    Input, real A(LDA,N), the output from SSIFA.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer KPVT(N), the pivot vector from SSIFA.
%
%    Input, integer JOB, specifies the tasks.
%    JOB has the decimal expansion ABC where
%    If C /= 0, the inverse is computed,
%    If B /= 0, the determinant is computed,
%    If A /= 0, the inertia is computed.
%    For example, JOB = 111 gives all three.
%
%    Output, real A(LDA,N), the upper triangle of the inverse of the 
%    original matrix.  The strict lower triangle is never referenced.
%
%    Output, real DET(2), the determinant of the original matrix,
%    if requested.
%      determinant = DET(1) * 10.0**DET(2)
%    with 1.0D+00 <= abs ( DET(1) ) < 10.0D+00 or DET(1) = 0.0.
%
%    Output, integer INERT(3), the inertia of the original matrix.
%    INERT(1) = number of positive eigenvalues.
%    INERT(2) = number of negative eigenvalues.
%    INERT(3) = number of zero eigenvalues.
%
  ten = 10.0;

  doinv = mod ( job,   10 )                ~= 0;
  dodet = floor ( mod ( job,  100 ) /  10 ) ~= 0;
  doert = floor ( mod ( job, 1000 ) / 100 ) ~= 0;

  inert(1:3) = 0

  det(1) = 1.0;
  det(2) = 0.0;

  if ( dodet | doert )

    t = 0.0;

    for k = 1 : n

      d = a(k,k);
%
%  2 by 2 block.
%
%  use det (d  s)  =  (d/t * c - t) * t,  t = abs ( s )
%          (s  c)
%  to avoid underflow/overflow troubles.
%
%  Take two passes through scaling.  Use T for flag.
%
      if ( kpvt(k) <= 0 )

        if ( t == 0.0 )
          t = abs ( a(k,k+1) );
          d = ( d / t ) * a(k+1,k+1) - t;
        else
          d = t;
          t = 0.0;
        end

      end

      if ( doert )
        if ( 0.0 < d )
          inert(1) = inert(1) + 1;
        elseif ( d < 0.0 )
          inert(2) = inert(2) + 1;
        elseif ( d == 0.0 )
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

    end

  end
%
%  Compute inverse(A).
%
  if ( doinv )

    k = 1;

    while ( k <= n )

      if ( 0 <= kpvt(k) )
%
%  1 by 1.
%
        a(k,k) = 1.0 / a(k,k);

        if ( 2 <= k )

          work(1:k-1) = a(1:k-1,k);

          for j = 1 : k-1
            a(j,k) = sdot ( j, a(1:j,j), 1, work(1:j), 1 );
            a(1:j-1,k) = saxpy ( j-1, work(j), a(1:j-1,j), 1, a(1:j-1,k), 1 );
          end

          a(k,k) = a(k,k) + sdot ( k-1, work(1:k-1), 1, a(1:k-1,k), 1 );

        end

        kstep = 1;
%
%  2 by 2.
%
      else

        t = abs ( a(k,k+1) );
        ak = a(k,k) / t;
        akp1 = a(k+1,k+1) / t;
        akkp1 = a(k,k+1) / t;
        d = t * ( ak * akp1 - 1.0 );
        a(k,k) = akp1 / d;
        a(k+1,k+1) = ak / d;
        a(k,k+1) = -akkp1 / d;

        if ( 2 <= k )

          work(1:k-1) = a(1:k-1,k+1);

          for j = 1 : k-1
            a(j,k+1) = sdot ( j, a(1:j,j), 1, work(1:j), 1 );
            a(1:j-1,k+1) = saxpy ( j-1, work(j), a(1:j-1,j), 1, ...
              a(1:j-1,k+1), 1 );
          end

          a(k+1,k+1) = a(k+1,k+1) ...
            + sdot ( k-1, work(1:k-1), 1, a(1:k-1,k+1), 1 );
          a(k,k+1) = a(k,k+1) + sdot ( k-1, a(1:k-1,k), 1, a(1:k-1,k+1), 1 );
          work(1:k-1) = a(1:k-1,k);

          for j = 1 : k-1
            a(j,k) = sdot ( j, a(1:j,j), 1, work(1:j), 1 );
            a(1:j-1,k) = saxpy ( j-1, work(j), a(1:j-1,j), 1, a(1:j-1,k), 1 );
          end

          a(k,k) = a(k,k) + sdot ( k-1, work(1:k-1), 1, a(1:k-1,k), 1 );

        end

        kstep = 2;

      end
%
%  Swap.
%
      ks = abs ( kpvt(k) );

      if ( ks ~= k )

        temp(1:ks) = a(1:ks,ks);
        a(1:ks,ks) = a(1:ks,k);
        a(1:ks,k)  = temp(1:ks)

        for jb = ks : k
          j = k + ks - jb;
          temp = a(j,k);
          a(j,k) = a(ks,j);
          a(ks,j) = temp;
        end

        if ( kstep ~= 1 )
          temp = a(ks,k+1);
          a(ks,k+1) = a(k,k+1);
          a(k,k+1) = temp;
        end

      end

      k = k + kstep;

    end

  end

  return
end
