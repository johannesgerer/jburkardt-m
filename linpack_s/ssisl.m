function b = ssisl ( a, lda, n, kpvt, b )

%*****************************************************************************80
%
%% SSISL solves a real symmetric system factored by SSIFA.
%
%  Discussion:
%
%    To compute inverse(A) * C where C is a matrix with P columns
%
%      call ssifa ( a, lda, n, kpvt, info )
%
%      if ( info == 0 ) then
%        do j = 1, p
%          call ssisl ( a, lda, n, kpvt, c(1,j) )
%        end do
%      end if
%
%    A division by zero may occur if the inverse is requested
%    and SSICO has set RCOND == 0.0D+00 or SSIFA has set INFO /= 0.
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
%    Input, real B(N), the right hand side.
%
%    Output, real B(N), the solution.
%

%
%  Loop backward applying the transformations and D inverse to B.
%
  k = n;

  while ( 0 < k )

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
        b(1:k-1) = saxpy ( k-1, b(k), a(1:k-1,k), 1, b(1:k-1), 1 );

      end
%
%  Apply D inverse.
%
      b(k) = b(k) / a(k,k);
      k = k - 1;

    else
%
%  2 x 2 pivot block.
%
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
        b(1:k-2) = saxpy ( k-2, b(k), a(1:k-2,k), 1, b(1:k-2), 1 );
        b(1:k-2) = saxpy ( k-2, b(k-1), a(1:k-2,k-1), 1, b(1:k-2), 1 );
   
      end
%
%  Apply D inverse.
%
      ak = a(k,k) / a(k-1,k);
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = b(k) / a(k-1,k);
      bkm1 = b(k-1) / a(k-1,k);
      denom = ak * akm1 - 1.0;
      b(k) = ( akm1 * bk - bkm1 ) / denom;
      b(k-1) = ( ak * bkm1 - bk ) / denom;
      k = k - 2;

    end

  end
%
%  Loop forward applying the transformations.
%
  k = 1;

  while ( k <= n )

    if ( 0 <= kpvt(k) )
%
%  1 x 1 pivot block.
%
      if ( k ~= 1 )
%
%  Apply the transformation.
%
        b(k) = b(k) + b(1:k-1)' * a(1:k-1,k);
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

      k = k + 1;

    else
%
%  2 x 2 pivot block.
%
      if ( k ~= 1 )
%
%  Apply the transformation.
%
        b(k) = b(k) + b(1:k-1) * a(1:k-1,k);
        b(k+1) = b(k+1) + b(1:k-1) * a(1:k-1,k+1);
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

      k = k + 2;

    end

  end

  return
end
