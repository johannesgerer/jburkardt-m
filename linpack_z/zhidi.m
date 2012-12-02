function [ a, det, inert ] = zhidi ( a, lda, n, ipvt, job )

%*****************************************************************************80
%
%% ZHIDI computes the determinant and inverse of a matrix factored by ZHIFA.
%
%  Discussion:
%
%    ZHIDI computes the determinant, inertia (number of positive, zero,
%    and negative eigenvalues) and inverse of a complex hermitian matrix
%    using the factors from ZHIFA.
%
%    A division by zero may occur if the inverse is requested
%    and ZHICO has set RCOND == 0.0 or ZHIFA has set INFO /= 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 May 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, complex A(LDA,N); the factored matrix from ZHIFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from ZHIFA.
%
%    Input, integer JOB, has the decimal expansion ABC where:
%    if C /= 0, the inverse is computed,
%    if B /= 0, the determinant is computed,
%    if A /= 0, the inertia is computed.
%    For example, JOB = 111 gives all three.
%
%    Output, complex A(LDA,N); if the inverse was requested, A contains
%    the inverse matrix.  The strict lower triangle of A is never
%    referenced.
%
%    Output, real DET(2), the determinant of the original matrix.
%    Determinant = DET(1) * 10.0**DET(2) with 1.0 <= abs ( DET(1) ) < 10.0
%    or DET(1) = 0.0.
%
%    Output, integer INERT(3), the inertia of the original matrix.
%    INERT(1) = number of positive eigenvalues.
%    INERT(2) = number of negative eigenvalues.
%    INERT(3) = number of zero eigenvalues.
%
  inert = [];
  det = [];

  noinv = floor ( mod ( job,   10 )       ) == 0;
  nodet = floor ( mod ( job,  100 ) /  10 ) == 0;
  noert = floor ( mod ( job, 1000 ) / 100 ) == 0;

  if ( ~nodet || ~noert )

    if ( ~noert )
      inert(1:3) = 0;
    end

    if ( ~nodet )
      det(1) = 1.0;
      det(2) = 0.0;
    end

    t = 0.0;

    for k = 1 : n

      d = real ( a(k,k) );
%
%  Check if 1 by 1.
%
      if ( ipvt(k) <= 0 )
%
%  2 by 2 block
%  Use DET = ( D / T * C - T ) * T, T = abs ( S )
%  to avoid underflow/overflow troubles.
%  Take two passes through scaling.  Use T for flag.
%
        if ( t == 0.0 )
          t = abs ( a(k,k+1) );
          d = ( d / t ) * real ( a(k+1,k+1) ) - t;
        else
          d = t;
          t = 0.0;
        end

      end

      if ( ~noert )
        if ( 0.0 < d )
          inert(1) = inert(1) + 1;
        elseif ( d < 0.0 )
          inert(2) = inert(2) + 1;
        elseif ( d == 0.0 )
          inert(3) = inert(3) + 1;
        end
      end

      if ( ~nodet )

        det(1) = det(1) * d;

        if ( det(1) ~= 0.0 )

          while ( abs ( det(1) ) < 1.0 )
            det(1) = det(1) * 10.0;
            det(2) = det(2) - 1.0;
          end

          while ( 10.0 <= abs ( det(1) ) )
            det(1) = det(1) / 10.0;
            det(2) = det(2) + 1.0;
          end

        end

      end

    end

  end
%
%  Compute inverse(A).
%
  if ( ~noinv )

    k = 1;

    while ( k <= n )

      km1 = k - 1;

      if ( 0 <= ipvt(k) )
%
%  1 by 1
%
        a(k,k) = 1.0 / real ( a(k,k) );

        if ( 1 <= km1 )

          work(1:km1) = a(1:km1,k);

          for j = 1 : km1
            a(j,k) = work(1:j) * conj ( a(1:j,j) );
            a(1:j-1,k) = a(1:j-1,k) + work(j) * a(1:j-1,j);
          end

          a(k,k) = a(k,k) + real ( conj ( work(1:km1) ) * a(1:km1,k) );

        end

        kstep = 1;

      else
%
%  2 by 2
%
        t = abs ( a(k,k+1) );
        ak = real ( a(k,k) ) / t;
        akp1 = real ( a(k+1,k+1) ) / t;
        akkp1 = a(k,k+1) / t;
        d = t * ( ak * akp1 - 1.0 );
        a(k,k) = akp1 / d;
        a(k+1,k+1) = ak / d;
        a(k,k+1) = -akkp1 / d;

        if ( 1 <= km1 )

          work(1:km1) = a(1:km1,k+1);

          for j = 1 : km1
            a(j,k+1) = work(1:j) * conj ( a(1:j,j) );
            a(1:j-1,k+1) = a(1:j-1,k+1) + work(j) * a(1:j-1,j);
          end

          a(k+1,k+1) = a(k+1,k+1) + ...
            real ( conj ( work(1:km1) ) * a(1:km1,k+1) );

          a(k,k+1) = a(k,k+1) ...
            + transpose ( conj ( a(1:km1,k) ) ) * a(1:km1,k+1);

          work(1:km1) = a(1:km1,k);

          for j = 1 : km1
            a(j,k) = work(1:j) * conj ( a(1:j,j) );
            a(1:j-1,k) = a(1:j-1,k) + work(j) * a(1:j-1,j);
          end

          a(k,k) = a(k,k) + real ( conj ( work(1:km1) ) * a(1:km1,k) );

        end

        kstep = 2;

      end
%
%  Swap
%
      ks = abs ( ipvt(k) );

      if ( ks ~= k )

        temp       = a(1:ks,ks);
        a(1:ks,ks) = a(1:ks,k);
        a(1:ks,k)  = temp;

        for j = k : -1 : ks
          temp    = conj ( a(j,k) );
          a(j,k)  = conj ( a(ks,j) );
          a(ks,j) = temp;
        end

        if ( kstep ~= 1 )
          temp      = a(ks,k+1);
          a(ks,k+1) = a(k,k+1);
          a(k,k+1)  = temp;
        end

      end

      k = k + kstep;

    end

  end

  return
end
