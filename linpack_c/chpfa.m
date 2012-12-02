function [ ap, ipvt, info ] = chpfa ( ap, n )

%*****************************************************************************80
%
%% CHPFA factors a complex hermitian packed matrix.
%
%  Discussion:
%
%    To solve A*X = B, follow CHPFA by CHPSL.
%
%    To compute inverse(A)*C, follow CHPFA by CHPSL.
%
%    To compute determinant(A), follow CHPFA by CHPDI.
%
%    To compute inertia(A), follow CHPFA by CHPDI.
%
%    To compute inverse(A), follow CHPFA by CHPDI.
%
%  Packed storage:
%
%    The following program segment will pack the upper
%    triangle of a hermitian matrix.
%
%      k = 0
%      do j = 1, n
%        do i = 1, j
%          k = k + 1
%          ap(k) = a(i,j)
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
%    Input, complex AP(N*(N+1)/2); the packed form
%    of a hermitian matrix.  The columns of the upper triangle are
%    stored sequentially in a one-dimensional array.  
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex AP(N*(N+1)/2); a block diagonal matrix and the 
%    multipliers which were used to obtain it stored in packed form.  
%    The factorization can be written A = U*D*hermitian(U) where U is a 
%    product of permutation and unit upper triangular matrices, hermitian(U) 
%    is the conjugate transpose of U, and D is block diagonal with 1 by 1
%    and 2 by 2 blocks.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, integer INFO.
%    0, normal value.
%    K, if the K-th pivot block is singular.  This is not an error condition
%    for this subroutine, but it does indicate that CHPSL or CHPDI may divide
%    by zero if called.
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
  ik = ( n * ( n - 1 ) ) / 2;

  while ( 1 )
%
%  Leave the loop if K = 0 or K = 1.
%
    if ( k == 0 )
      break
    end

    if ( k == 1 )
      ipvt(1) = 1;
      if ( cabs1 ( ap(1) ) == 0.0 )
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
    kk = ik + k;
    absakk = cabs1 ( ap(kk) );
%
%  Determine the largest off-diagonal element in column K.
%
    imax = icamax ( k-1, ap(ik+1:ik+k-1), 1 );
    imk = ik + imax;
    colmax = cabs1 ( ap(imk) );

    if ( alpha * colmax <= absakk )

      kstep = 1;
      swap = 0;
%
%  Determine the largest off-diagonal element in row IMAX.
%
    else

      rowmax = 0.0;
      im = ( imax * ( imax - 1 ) ) / 2;
      imj = im + 2 * imax;

      for j = imax + 1 : k
        rowmax = max ( rowmax, cabs1 ( ap(imj) ) );
        imj = imj + j;
      end

      if ( imax ~= 1 )
        jmax = icamax ( imax-1, ap(im+1:im+imax-1), 1 );
        jmim = jmax + im;
        rowmax = max ( rowmax, cabs1 ( ap(jmim) ) );
      end

      imim = imax + im;

      if ( alpha * rowmax <= cabs1 ( ap(imim) ) )
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
      ik = ik - ( k - 1 );
      if ( kstep == 2 )
        ik = ik - ( k - 2 );
      end
      k = k - kstep;
      continue
    end

    if ( kstep ~= 2 )
%
%  1 x 1 pivot block.
%
      if ( swap )

        temp             = ap(im+1:im+imax);
        ap(im+1:im+imax) = ap(ik+1:ik+imax);
        ap(ik+1:ik+imax) = temp;

        imj = ik + imax;

        for jj = imax : k
          j = k + imax - jj;
          jk = ik + j;
          t       = conj ( ap(jk) );
          ap(jk)  = conj ( ap(imj) );
          ap(imj) = t;
          imj = imj - ( j - 1 );
        end

      end
%
%  Perform the elimination.
%
      ij = ik - ( k - 1 );
      for jj = 1 : km1
        j = k - jj;
        jk = ik + j;
        mulk = -ap(jk) / ap(kk);
        t = conj ( mulk );
        ap(ij+1:ij+j) = ap(ij+1:ij+j) + t * ap(ik+1:ik+j);
        ijj = ij + j;
        ap(ijj) = real ( ap(ijj) );
        ap(jk) = mulk;
        ij = ij - ( j - 1 );
      end
%
%  Set the pivot array.
%
      if ( swap )
        ipvt(k) = imax;
      else
        ipvt(k) = k;
      end
%
%  2 x 2 pivot block.
%
    else

      km1k = ik + k - 1;
      ikm1 = ik - ( k - 1 );

      if ( swap )

        temp                 = ap(im+1:im+imax);
        ap(im+1:im+imax)     = ap(ikm1+1:ikm1+imax);
        ap(ikm1+1:ikm1+imax) = temp;

        imj = ikm1 + imax;

        for jj = imax : km1
          j = km1 + imax - jj;
          jkm1 = ikm1 + j;
          t        = conj ( ap(jkm1) );
          ap(jkm1) = conj ( ap(imj) );
          ap(imj)  = t;
          imj = imj - ( j - 1 );
        end

        t        = ap(km1k);
        ap(km1k) = ap(imk);
        ap(imk)  = t;

      end
%
%  Perform the elimination.
%
      km2 = k - 2;

      if ( km2 ~= 0 )

        ak = ap(kk) / ap(km1k);
        km1km1 = ikm1 + k - 1;
        akm1 = ap(km1km1) / conj ( ap(km1k) );
        denom = 1.0 - ak * akm1;
        ij = ik - ( k - 1 ) - ( k - 2 );

        for jj = 1 : km2
          j = km1 - jj;
          jk = ik + j;
          bk = ap(jk) / ap(km1k);
          jkm1 = ikm1 + j;
          bkm1 = ap(jkm1) / conj ( ap(km1k) );
          mulk = ( akm1 * bk - bkm1 ) / denom;
          mulkm1 = ( ak * bkm1 - bk ) / denom;
          t = conj ( mulk );
          ap(ij+1:ij+j) = ap(ij+1:ij+j) + t * ap(ik+1:ik+j);
          t = conj ( mulkm1 );
          ap(ij+1:ij+j) = ap(ij+1:ij+j) + t * ap(ikm1+1:ikm1+j);
          ap(jk) = mulk;
          ap(jkm1) = mulkm1;
          ijj = ij + j;
          ap(ijj) = real ( ap(ijj) );
          ij = ij - ( j - 1 );
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

    ik = ik - ( k - 1 );
    if ( kstep == 2 )
      ik = ik - ( k - 2 );
    end

    k = k - kstep;

  end

  return
end
