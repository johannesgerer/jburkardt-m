function [ ap, kpvt, info ] = sspfa ( ap, n )

%*****************************************************************************80
%
%% SSPFA factors a real symmetric matrix stored in packed form.
%
%  Discussion:
%
%    To solve A*X = B, follow SSPFA by SSPSL.
%
%    To compute inverse(A)*C, follow SSPFA by SSPSL.
%
%    To compute determinant(A), follow SSPFA by SSPDI.
%
%    To compute inertia(A), follow SSPFA by SSPDI.
%
%    To compute inverse(A), follow SSPFA by SSPDI.
%
%  Packed storage:
%
%    The following program segment will pack the upper triangle of a 
%    symmetric matrix.
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
%    Input, real AP(N*(N+1)/2), the packed form of a
%    symmetric matrix A.  The columns of the upper triangle are stored
%    sequentially in a one-dimensional array.  
%
%    Input, integer N, the order of the matrix.
%
%    Output, real AP(N*(N+1)/2), a block diagonal matrix and the 
%    multipliers which were used to obtain it stored in 
%    packed form.  The factorization can be written A = U*D*U' where U 
%    is a product of permutation and unit upper triangular matrices, U' 
%    is the transpose of U, and D is block diagonal with 1 by 1 and 2 
%    by 2 blocks.
%
%    Output, integer KPVT(N), the pivot indices.
%
%    Output, integer INFO, error flag.
%    0, normal value.
%    K, if the K-th pivot block is singular.  This is not an error 
%    condition for this subroutine, but it does indicate that SSPSL or 
%    SSPDI may divide by zero if called.
%

%
%  ALPHA is used in choosing pivot block size.
%
  alpha = ( 1.0 + sqrt ( 17.0 ) ) / 8.0;

  info = 0;
%
%  Main loop on K, which goes from N to 1.
%
  k = n;
  ik = floor ( ( n * ( n - 1 ) ) / 2 );

  while ( 1 )
%
%  Leave the loop if K = 0 or K = 1.
%
    if ( k == 0 )
      break
    end

    if ( k == 1 )
      kpvt(1) = 1;
      if ( ap(1) == 0.0 )
        info = 1;
      end
      break
    end
%
%  This section of code determines the kind of elimination to be performed.  
%  When it is completed, KSTEP will be set to the size of the pivot block, 
%  and SWAP will be set to .true. if an interchange is required.
%
    km1 = k - 1;
    kk = ik + k;
    absakk = abs ( ap(kk) );
%
%  Determine the largest off-diagonal element in column K.
%
    imax = isamax ( k-1, ap(ik+1:ik+k-1), 1 );
    imk = ik + imax;
    colmax = abs ( ap(imk) );

    if ( alpha * colmax <= absakk )

      kstep = 1;
      swap = 0;
%
%  Determine the largest off-diagonal element in row IMAX.
%
    else

      rowmax = 0.0;
      imaxp1 = imax + 1;
      im = floor ( imax * ( imax - 1 ) ) / 2;
      imj = im + 2 * imax;

      for j = imaxp1 : k
        rowmax = max ( rowmax, abs ( ap(imj) ) );
        imj = imj + j;
      end

      if ( imax ~= 1 )
        jmax = isamax ( imax-1, ap(im+1:im+imax-1), 1 );
        jmim = jmax + im;
        rowmax = max ( rowmax, abs ( ap(jmim) ) );
      end

      imim = imax + im;

      if ( alpha * rowmax <= abs ( ap(imim) ) )
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

      kpvt(k) = k;
      info = k;

    else

      if ( kstep ~= 2 )
%
%  1 x 1 pivot block.
%
        if ( swap )
%
%  Perform an interchange.
%
          temp(1:imax) = ap(im+1:im+imax);
          ap(im+1:im+imax) = ap(ik+1:ik+imax);
          ap(ik+1:ik+imax) = temp(1:imax);

          imj = ik + imax;

          for jj = imax : k
            j = k + imax - jj;
            jk = ik + j;
            t = ap(jk);
            ap(jk) = ap(imj);
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
          t = mulk;
          ap(ij+1:ij+j) = saxpy ( j, t, ap(ik+1:ik+j), 1, ap(ij+1:ij+j), 1 );
          ijj = ij + j;
          ap(jk) = mulk;
          ij = ij - ( j - 1 );
        end
%
%  Set the pivot array.
%
        if ( swap ) then
          kpvt(k) = imax;
        else
          kpvt(k) = k;
        end

      else
%
%  2 x 2 pivot block.
%
        km1k = ik + k - 1;
        ikm1 = ik - ( k - 1 );
%
%  Perform an interchange.
%
        if ( swap )

          temp(1:imax) = ap(im+1:im+imax);
          ap(im+1:im+imax) = ap(ikm1+1:ikm1+imax);
          ap(ikm1+1:ikm1+imax) = temp(1:imax);

          imj = ikm1 + imax;

          for jj = imax : km1
            j = km1 + imax - jj;
            jkm1 = ikm1 + j;
            t = ap(jkm1);
            ap(jkm1) = ap(imj);
            ap(imj) = t;
            imj = imj - ( j - 1 );
          end

          t = ap(km1k);
          ap(km1k) = ap(imk);
          ap(imk) = t;

        end
%
%  Perform the elimination.
%
        if ( k-2 ~= 0 )

          ak = ap(kk) / ap(km1k);
          km1km1 = ikm1 + k - 1;
          akm1 = ap(km1km1) / ap(km1k);
          denom = 1.0 - ak * akm1;
          ij = ik - ( k - 1 ) - ( k - 2 );

          for jj = 1 : k-2

            j = km1 - jj;
            jk = ik + j;
            bk = ap(jk) / ap(km1k);
            jkm1 = ikm1 + j;
            bkm1 = ap(jkm1) / ap(km1k);
            mulk = ( akm1 * bk - bkm1 ) / denom;
            mulkm1 = ( ak * bkm1 - bk ) / denom;
            t = mulk;
            ap(ij+1:ij+j) = saxpy ( j, t, ap(ik+1:ik+j), 1, ap(ij+1:ij+j), 1 );
            t = mulkm1;
            ap(ij+1:ij+j) = saxpy ( j, t, ap(ikm1+1:ikm1+j), 1, ap(ij+1:ij+j), 1 );
            ap(jk) = mulk;
            ap(jkm1) = mulkm1;
            ijj = ij + j;
            ij = ij - ( j - 1 );
          end

        end
%
%  Set the pivot array.
%
        if ( swap )
          kpvt(k) = -imax;
        else
          kpvt(k) = 1 - k;
        end

        kpvt(k-1) = kpvt(k);

      end

    end

    ik = ik - ( k - 1 );
    if ( kstep == 2 )
      ik = ik - ( k - 2 );
    end

    k = k - kstep;

  end

  return
end
