function b = chpsl ( ap, n, ipvt, b )

%*****************************************************************************80
%
%% CHPSL solves a complex hermitian system factored by CHPFA.
%
%  Discussion:
%
%    A division by zero may occur if CHPCO set RCOND to 0.0
%    or CHPFA set INFO nonzero.
%
%    To compute
%
%      inverse ( A ) * C
%
%    where C is a matrix with P columns
%
%      call chpfa(ap,n,ipvt,info)
%
%      if ( info == 0 )
%        do j = 1, p
%          call chpsl(ap,n,ipvt,c(1,j))
%        end do
%      end
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2007
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
%    Input, complex AP(N*(N+1)/2), the output from CHPFA.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer IPVT(N), the pivot vector from CHPFA.
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%

%
%  Loop backward applying the transformations and inverse ( D ) to B.
%
  k = n;
  ik = ( n * ( n - 1 ) ) / 2;

  while ( 0 < k )

    kk = ik + k;
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

        b(1:k-1) = b(1:k-1) + b(k) * ap(ik+1:ik+k-1);

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

        kp = abs ( ipvt(k) );

        if ( kp ~= k - 1 )
          t      = b(k-1);
          b(k-1) = b(kp);
          b(kp)  = t;
        end

        b(1:k-2) = b(1:k-2) + b(k)   * ap(ik+1:ik+k-2);
        b(1:k-2) = b(1:k-2) + b(k-1) * ap(ikm1+1:ikm1+k-2);

      end
%
%  Apply D inverse.
%
      km1k = ik + k - 1;
      kk = ik + k;
      ak = ap(kk) / conj ( ap(km1k) );
      km1km1 = ikm1 + k - 1;
      akm1 = ap(km1km1) / ap(km1k);
      bk = b(k) / conj ( ap(km1k) );
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
%
%  1 x 1 pivot block.
%
    if ( 0 <= ipvt(k) )

      if ( k ~= 1 )

        b(k) = b(k) + conj ( ap(ik+1:ik+k-1) ) * transpose ( b(1:k-1) );
        kp = ipvt(k);

        if ( kp ~= k )
          t     = b(k);
          b(k)  = b(kp);
          b(kp) = t;
        end

      end

      ik = ik + k;
      k = k + 1;
%
%  2 x 2 pivot block.
%
    else

      if ( k ~= 1 )

        b(k) = b(k) + conj ( ap(ik+1:ik+k-1) ) * transpose ( b(1:k-1) );
        ikp1 = ik + k;
        b(k+1) = b(k+1) ...
          + conj ( ap(ikp1+1:ikp1+k-1) ) * transpose ( b(1:k-1) );
        kp = abs ( ipvt(k) );

        if ( kp ~= k )
          t     = b(k);
          b(k)  = b(kp);
          b(kp) = t;
        end

      end

      ik = ik + k + k + 1;
      k = k + 2;

    end

  end

  return
end
