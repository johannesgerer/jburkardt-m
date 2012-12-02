function [ a, kpvt, info ] = ssifa ( a, lda, n )

%*****************************************************************************80
%
%% SSIFA factors a real symmetric matrix.
%
%  Discussion:
%
%    To solve A*X = B, follow SSIFA by SSISL.
%
%    To compute inverse(A)*C, follow SSIFA by SSISL.
%
%    To compute determinant(A), follow SSIFA by SSIDI.
%
%    To compute inertia(A), follow SSIFA by SSIDI.
%
%    To compute inverse(A), follow SSIFA by SSIDI.
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
%    Input, real A(LDA,N), the symmetric matrix to be factored.  Only 
%    the diagonal and upper triangle are used.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(LDA,N), a block diagonal matrix and the multipliers which
%    were used to obtain it.  The factorization can be written A = U*D*U'
%    where U is a product of permutation and unit upper triangular 
%    matrices, U' is the transpose of U, and D is block diagonal
%    with 1 by 1 and 2 by 2 blocks.
%
%    Output, integer KPVT(N), the pivot indices.
%
%    Output, integer INFO, error flag.
%    0, normal value.
%    K, if the K-th pivot block is singular.  This is not an error 
%    condition for this subroutine, but it does indicate that SSISL
%    or SSIDI may divide by zero if called.
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

  while ( 0 < k )

    if ( k == 1 )
      kpvt(1) = 1;
      if ( a(1,1) == 0.0 )
        info = 1;
      end
      return
    end
%
%  This section of code determines the kind of
%  elimination to be performed.  When it is completed,
%  KSTEP will be set to the size of the pivot block, and
%  SWAP will be set to .true. if an interchange is required.
%
    km1 = k - 1;
    absakk = abs ( a(k,k) );
%
%  Determine the largest off-diagonal element in column K.
%
    imax = isamax ( k-1, a(1:k-1,k), 1 );
    colmax = abs ( a(imax,k) );

    if ( alpha * colmax <= absakk )

      kstep = 1;
      swap = 0;
%
%  Determine the largest off-diagonal element in row IMAX.
%
    else

      rowmax = 0.0;
      imaxp1 = imax + 1;
      for j = imaxp1 : k
        rowmax = max ( rowmax, abs ( a(imax,j) ) );
      end

      if ( imax ~= 1 )
        jmax = isamax ( imax-1, a(1:imax-1,imax), 1 );
        rowmax = max ( rowmax, abs ( a(jmax,imax) ) );
      end

      if ( alpha * rowmax <= abs ( a(imax,imax) ) )
        kstep = 1;
        swap = 1;
      elseif ( alpha * colmax * ( colmax / rowmax ) <= absakk )
        kstep = 1;
        swap = 0;
      else
        kstep = 2;
        swap = ( imax ~= k-1 )
      end

    end
%
%  Column K is zero.  
%  Set INFO and iterate the loop.
%
    if ( max ( absakk, colmax ) == 0.0 )

      kpvt(k) = k;
      info = k;
%
%  1 x 1 pivot block.
%
%  Perform an interchange.
%
    elseif ( kstep ~= 2 )

      if ( swap )

        [ a(1:imax,imax), a(1:imax,k) ] = ...
          sswap ( imax, a(1:imax,imax), 1, a(1:imax,k), 1 );

        for jj = imax : k
          j = k + imax - jj;
          t = a(j,k);
          a(j,k) = a(imax,j);
          a(imax,j) = t;
        end

      end
%
%  Perform the elimination.
%
      for jj = 1 : k-1
        j = k - jj;
        mulk = -a(j,k) / a(k,k);
        t = mulk;
        a(1:j,j) = saxpy ( j, t, a(1:j,k), 1, a(1:j,j), 1 );
        a(j,k) = mulk;
      end
%
%  Set the pivot array.
%
      if ( swap )
        kpvt(k) = imax;
      else
        kpvt(k) = k;
      end
%
%  2 x 2 pivot block.
%
%  Perform an interchange.
%
    else

      if ( swap )

        [ a(1:imax,imax), a(1:imax,k-1) ] = ...
          sswap ( imax, a(1:imax,imax), 1, a(1:imax,k-1), 1 );

        for jj = imax : k-1
          j = k-1 + imax - jj;
          t = a(j,k-1);
          a(j,k-1) = a(imax,j);
          a(imax,j) = t;
        end

        t = a(k-1,k);
        a(k-1,k) = a(imax,k);
        a(imax,k) = t;
  
      end
%
%  Perform the elimination.
%
      if ( k-2 ~= 0 )

        ak = a(k,k) / a(k-1,k);
        akm1 = a(k-1,k-1) / a(k-1,k);
        denom = 1.0 - ak * akm1;

        for jj = 1 : k-2

          j = k - 1 - jj;
          bk = a(j,k) / a(k-1,k);
          bkm1 = a(j,k-1) / a(k-1,k);
          mulk = ( akm1 * bk - bkm1 ) / denom;
          mulkm1 = ( ak * bkm1 - bk ) / denom;
          t = mulk;
          a(1:j,j) = saxpy ( j, t, a(1:j,k), 1, a(1:j,j), 1 );
          t = mulkm1;
          a(1:j,j) = saxpy ( j, t, a(1:j,k-1), 1, a(1:j,j), 1 );
          a(j,k) = mulk;
          a(j,k-1) = mulkm1;

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

    k = k - kstep;

  end

  return
end

