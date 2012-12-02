function b = dspsl ( ap, n, kpvt, b )

%*****************************************************************************80
%
%% DSPSL solves the real symmetric system factored by DSPFA.
%
%  Discussion:
%
%    To compute inverse(A) * C where C is a matrix with P columns:
%
%      call dspfa ( ap, n, kpvt, info )
%
%      if ( info /= 0 ) go to ...
%
%      do j = 1, p
%        call dspsl ( ap, n, kpvt, c(1,j) )
%      end do
%
%    A division by zero may occur if DSPCO has set RCOND == 0.0D+00
%    or DSPFA has set INFO /= 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2005
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
%    Input, real ( kind = 8 ) AP(N*(N+1)/2), the output from DSPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer KPVT(N), the pivot vector from DSPFA.
%
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%

%
%  Loop backward applying the transformations and D inverse to B.
%
  k = n;
  ik = floor ( ( n * ( n - 1 ) ) / 2 );

  while ( 0 < k ) 

    kk = ik + k;

    if ( 0 <= kpvt(k) )
%
%  1 x 1 pivot block.
%
      if ( k ~= 1 )

        kp = kpvt(k);
%
%  Interchange.
%
        if ( kp ~= k )
          temp = b(k);
          b(k) = b(kp);
          b(kp) = temp;
        end
%
%  Apply the transformation.
%
        b(1:k-1) = daxpy ( k-1, b(k), ap(ik+1:ik+k-1), 1, b(1:k-1), 1 );

      end
%
%  Apply D inverse.
%
      b(k) = b(k) / ap(kk);
      k = k - 1;
      ik = ik - k;

    else
%
%  2 x 2 pivot block.
%
      ikm1 = ik - ( k - 1 );

      if ( k ~= 2 )

        kp = abs ( kpvt(k) );
%
%  Interchange.
%
        if ( kp ~= k-1 )
          temp = b(k-1);
          b(k-1) = b(kp);
          b(kp) = temp;
        end
%
%  Apply the transformation.
%
        b(1:k-2) = daxpy ( k-2, b(k), ap(ik+1:ik+k-2), 1, b(1:k-2), 1 );
        b(1:k-2) = daxpy ( k-2, b(k-1), ap(ikm1+1:ikm1+k-2), 1, b(1:k-2), 1 );

      end
%
%  Apply D inverse.
%
      km1k = ik + k - 1;
      kk = ik + k;
      ak = ap(kk) / ap(km1k);
      km1km1 = ikm1 + k - 1;
      akm1 = ap(km1km1) / ap(km1k);
      bk = b(k) / ap(km1k);
      bkm1 = b(k-1) / ap(km1k);
      denom = ak * akm1 - 1.0;
      b(k) = ( akm1 * bk - bkm1 ) / denom;
      b(k-1) = ( ak * bkm1 - bk ) / denom;
      k = k - 2;
      ik = ik - ( k + 1 ) - k;

    end

  end
%
%  Loop forward applying the transformations.
%
  k = 1;
  ik = 0;

  while ( k <= n )

    if ( 0 <= kpvt(k) )
%
%  1 x 1 pivot block.
%
      if ( k ~= 1 )
%
%  Apply the transformation.
%
        b(k) = b(k) + ddot ( k-1, ap(ik+1:ik+k-1), 1, b(1:k-1), 1 );
        kp = kpvt(k);
%
%  Interchange.
%
        if ( kp ~= k )
          temp = b(k);
          b(k) = b(kp);
          b(kp) = temp;
        end

      end

      ik = ik + k;
      k = k + 1;

    else
%
%  2 x 2 pivot block.
%
      if ( k ~= 1 )
%
%  Apply the transformation.
%
        b(k) = b(k) + ddot ( k-1, ap(ik+1:ik+k-1), 1, b(1:k-1), 1 );
        ikp1 = ik + k;
        b(k+1) = b(k+1) + ddot ( k-1, ap(ikp1+1:ikp1+k-1), 1, b(1:k-1), 1 );
        kp = abs ( kpvt(k) );
%
%  Interchange.
%
        if ( kp ~= k )
          temp = b(k);
          b(k) = b(kp);
          b(kp) = temp;
        end

      end

      ik = ik + k + k + 1;
      k = k + 2;

    end

  end

  return
end
