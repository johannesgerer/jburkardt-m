function b = chisl ( a, lda, n, ipvt, b )

%*****************************************************************************80
%
%% CHISL solves a complex hermitian system factored by CHIFA.
%
%  Discussion:
%
%    A division by zero may occur if CHICO has set RCOND == 0.0
%    or CHIFA has set INFO /= 0.
%
%    To compute inverse(A) * C where C is a matrix with P columns
%
%      call chifa(a,lda,n,ipvt,info)
%      if ( info == 0 )
%        do j = 1, p
%          call chisl(a,lda,n,ipvt,c(1,j))
%        end
%      end
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
%    Input, complex A(LDA,N), the output from CHIFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from CHIFA.
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%

%
%  Loop backward applying the transformations and D inverse to B.
%
  k = n;

  while ( 0 < k )
%
%  1 x 1 pivot block.
%
    if ( 0 <= ipvt(k) )

      if ( k ~= 1 )

        kp = ipvt(k);

        if ( kp ~= k )
          t     = b(k);
          b(k)  = b(kp);
          b(kp) = t;
        end

        b(1:k-1) = b(1:k-1) + a(1:k-1,k) * b(k);

      end
%
%  Apply D inverse.
%
      b(k) = b(k) / a(k,k);
      k = k - 1;
%
%  2 x 2 pivot block.
%
    else

      if ( k ~= 2 )

        kp = abs ( ipvt(k) );

        if ( kp ~= k - 1 )
          t      = b(k-1);
          b(k-1) = b(kp);
          b(kp)  = t;
        end

        b(1:k-2) = b(1:k-2) + b(k)   * a(1:k-2,k);
        b(1:k-2) = b(1:k-2) + b(k-1) * a(1:k-2,k-1);

      end
%
%  Apply D inverse.
%
      ak = a(k,k) / conj ( a(k-1,k) );
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = b(k) / conj ( a(k-1,k) );
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
%
%  1 x 1 pivot block.
%
    if ( 0 <= ipvt(k) )

      if ( k ~= 1 )

        b(k) = b(k) + b(1:k-1) * conj ( a(1:k-1,k) );
        kp = ipvt(k);

        if ( kp ~= k )
          t     = b(k);
          b(k)  = b(kp);
          b(kp) = t;
        end

      end

      k = k + 1;

    else
%
%  2 x 2 pivot block.
%
      if ( k ~= 1 )

        b(k) = b(k)     + b(1:k-1) * conj ( a(1:k-1,k) );
        b(k+1) = b(k+1) + b(1:k-1) * conj ( a(1:k-1,k+1) );
        kp = abs ( ipvt(k) );

        if ( kp ~= k )
          t     = b(k);
          b(k)  = b(kp);
          b(kp) = t;
        end

      end

      k = k + 2;

    end

  end

  return
end
