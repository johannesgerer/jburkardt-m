function [ a, ipvt, info ] = zhifa ( a, lda, n )

%*****************************************************************************80
%
%% ZHIFA factors a complex hermitian matrix.
%
%  Discussion:
%
%    ZHIFA performs the factoring by elimination with symmetric pivoting.
%
%    To solve A*X = B, follow ZHIFA by ZHISL.
%
%    To compute inverse(A)*C, follow ZHIFA by ZHISL.
%
%    To compute determinant(A), follow ZHIFA by ZHIDI.
%
%    To compute inertia(A), follow ZHIFA by ZHIDI.
%
%    To compute inverse(A), follow ZHIFA by ZHIDI.
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
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%
%  Parameters:
%
%    Input, complex A(LDA,N); the hermitian matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N); a block diagonal matrix and the multipliers which
%    were used to obtain it.  The factorization can be written
%    A = U*D*hermitian(U) where U is a product of permutation and unit upper
%    triangular matrices, hermitian(U) is the conjugate transpose of U, and
%    D is block diagonal with 1 by 1 and 2 by 2 blocks.  Only the diagonal
%    and upper triangle are used.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO.
%    0, normal value.
%    K, if the K-th pivot block is singular.  This is not an error condition
%    for this subroutine, but it does indicate that ZHISL or ZHIDI may
%    divide by zero if called.
%

%
%  Initialize.
%
%  ALPHA is used in choosing pivot block size.
%
  alpha = ( 1.0 + sqrt ( 17.0 ) ) / 8.0;

  info = 0;
%
%  Main loop on K, which goes from N to 1.
%
  k = n;

  while ( 1 )
%
%  Leave the loop if K = 0 or K = 1.
%
    if ( k == 0 )
      break
    end

    if ( k == 1 )
      ipvt(1) = 1;
      if ( zabs1 ( a(1,1) ) == 0.0 )
        info = 1;
      end
      break
    end
%
%  This section of code determines the kind of
%  elimination to be performed.  When it is completed,
%  KSTEP will be set to the size of the pivot block, and
%  SWAP will be set to TRUE if an interchange is
%  required.
%
    km1 = k - 1;
    absakk = zabs1 ( a(k,k) );
%
%  Determine the largest off-diagonal element in column K.
%
    imax = izamax ( k-1, a(1:k-1,k), 1 );
    colmax = zabs1 ( a(imax,k) );

    if ( alpha * colmax <= absakk )

      kstep = 1;
      swap = 0;

    else
%
%  Determine the largest off-diagonal element in row IMAX.
%
      rowmax = 0.0;

      for j = imax + 1 : k
        rowmax = max ( rowmax, zabs1 ( a(imax,j) ) );
      end

      if ( imax ~= 1 )
        jmax = izamax ( imax-1, a(1:imax-1,imax), 1 );
        rowmax = max ( rowmax, zabs1 ( a(jmax,imax) ) );
      end

      if ( alpha * rowmax <= zabs1 ( a(imax,imax) )  )
        kstep = 1;
        swap = 1;
      elseif ( alpha * colmax * ( colmax / rowmax ) <= absakk )
        kstep = 1;
        swap = 0;
      else
        kstep = 2;
        swap = ( imax ~= km1 );
      end

    end
%
%  Column K is zero.  Set INFO and iterate the loop.
%
    if ( max ( absakk, colmax ) == 0.0 )
      ipvt(k) = k;
      info = k;
      k = k - kstep;
      continue
    end

    if ( kstep ~= 2 )
%
%  1 x 1 pivot block.
%
      if ( swap )

        temp           = a(1:imax,imax);
        a(1:imax,imax) = a(1:imax,k);
        a(1:imax,k)    = temp;

        for jj = imax : k
          j = k + imax - jj;
          t         = conj ( a(j,k) );
          a(j,k)    = conj ( a(imax,j) );
          a(imax,j) = t;
        end

      end
%
%  Perform the elimination.
%
      for jj = 1 : km1
        j = k - jj;
        mulk = -a(j,k) / a(k,k);
        t = conj ( mulk );
        a(1:j,j) = a(1:j,j) + t * a(1:j,k);
        a(j,j) = real ( a(j,j) );
        a(j,k) = mulk;
      end
%
%  Set the pivot array.
%
      ipvt(k) = k;

      if ( swap )
        ipvt(k) = imax;
      end

    else
%
%  2 x 2 pivot block.
%
      if ( swap )

        temp           = a(1:imax,imax);
        a(1:imax,imax) = a(1:imax,k-1);
        a(1:imax,k-1)  = temp;

        for jj = imax : km1
          j = km1 + imax - jj;
          t         = conj ( a(j,k-1) );
          a(j,k-1)  = conj ( a(imax,j) );
          a(imax,j) = t;
        end

        t         = a(k-1,k);
        a(k-1,k)  = a(imax,k);
        a(imax,k) = t;

      end
%
%  Perform the elimination.
%
      km2 = k - 2;

      if ( 0 < k - 2 )

        ak = a(k,k) / a(k-1,k);
        akm1 = a(k-1,k-1) / conj ( a(k-1,k) );
        denom = 1.0 - ak * akm1;

        for jj = 1 : k - 2

          j = km1 - jj;
          bk = a(j,k) / a(k-1,k);
          bkm1 = a(j,k-1) / conj ( a(k-1,k) );
          mulk = ( akm1 * bk - bkm1 ) / denom;
          mulkm1 = ( ak * bkm1 - bk ) / denom;
          t = conj ( mulk );
          a(1:j,j) = a(1:j,j) + t * a(1:j,k);
          t = conj ( mulkm1 );
          a(1:j,j) = a(1:j,j) + t * a(1:j,k-1);
          a(j,k) = mulk;
          a(j,k-1) = mulkm1;
          a(j,j) = real ( a(j,j) );

        end

      end
%
%  Set the pivot array.
%
      if ( swap )
        ipvt(k) = -imax;
      else
        ipvt(k) = 1 - k;
      end

      ipvt(k-1) = ipvt(k);

    end

    k = k - kstep;

  end

  return
end

