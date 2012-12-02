function [ ap, ipvt, rcond ] = zhpco ( ap, n )

%*****************************************************************************80
%
%% ZHPCO factors a complex hermitian packed matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, ZHPFA is slightly faster.
%
%    To solve A*X = B, follow ZHPCO by ZHPSL.
%
%    To compute inverse(A)*C, follow ZHPCO by ZHPSL.
%
%    To compute inverse(A), follow ZHPCO by ZHPDI.
%
%    To compute determinant(A), follow ZHPCO by ZHPDI.
%
%    To compute inertia(A), follow ZHPCO by ZHPDI.
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
%    Input, complex AP(N*(N+1)/2); the packed form of a
%    hermitian matrix A.  The columns of the upper triangle are stored
%    sequentially in a one-dimensional array of length N*(N+1)/2.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex AP(N*(N+1)/2); a block diagonal matrix and the multipliers
%    which were used to obtain it stored in packed form.  The factorization
%    can be written A = U*D*hermitian(U) where U is a product of permutation
%    and unit upper triangular matrices, hermitian(U) is the conjugate
%    transpose of U, and D is block diagonal with 1 by 1 and 2 by 2 blocks.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition of
%    the matrix.  For the system A*X = B, relative perturbations in A and B
%    of size EPSILON may cause relative perturbations in X of size
%    (EPSILON/RCOND).  If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%  Local Parameters:
%
%    Local, complex Z(N), a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%

%
%  Find norm of A using only upper half.
%
  j1 = 1;

  for j = 1 : n

    z(j) = dzasum ( j, ap(j1:j1+j-1), 1 );
    ij = j1;
    j1 = j1 + j;

    for i = 1 : j-1
      z(i) = real ( z(i) ) + zabs1 ( ap(ij) );
      ij = ij + 1;
    end

  end

  anorm = 0.0;
  for j = 1 : n
    anorm = max ( anorm, real ( z(j) ) );
  end
%
%  Factor.
%
  [ ap, ipvt, info ] = zhpfa ( ap, n );
%
%  RCOND = 1/(norm(A) * (estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A*Z = Y and A*Y = E.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of W where U*D*W = E.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve U*D*W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  k = n;
  ik = ( n * ( n - 1 ) ) / 2;

  while ( 0 < k )

    kk = ik + k;
    ikm1 = ik - ( k - 1 );

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    kp = abs ( ipvt(k) );
    kps = k + 1 - ks;

    if ( kp ~= kps )
      t      = z(kps);
      z(kps) = z(kp);
      z(kp)  = t;
    end

    if ( zabs1 ( z(k) ) ~= 0.0 )
      ek = zsign1 ( ek, z(k) );
    end

    z(k) = z(k) + ek;
    z(1:k-ks) = z(1:k-ks) + z(k) * ap(ik+1:ik+k-ks);

    if ( ks ~= 1 )

      if ( zabs1 ( z(k-1) ) ~= 0.0 )
        ek = zsign1 ( ek, z(k-1) );
      end

      z(k-1) = z(k-1) + ek;
      z(1:k-ks) = z(1:k-ks) + z(k-1) * ap(ikm1+1:ikm1+k-ks);

    end

    if ( ks ~= 2 )

      if ( zabs1 ( ap(kk) ) < zabs1 ( z(k) ) )
        s = zabs1 ( ap(kk) ) / zabs1 ( z(k) );
        z(1:n) = z(1:n) * s;
        ek = s * ek;
      end

      if ( zabs1 ( ap(kk) ) ~= 0.0 )
        z(k) = z(k) / ap(kk);
      else
        z(k) = 1.0;
      end

    else

      km1k = ik + k - 1;
      km1km1 = ikm1 + k - 1;
      ak = ap(kk) / conj ( ap(km1k) );
      akm1 = ap(km1km1) / ap(km1k);
      bk = z(k) / conj ( ap(km1k) );
      bkm1 = z(k-1) / ap(km1k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;
    ik = ik - k;

    if ( ks == 2 )
      ik = ik - ( k + 1 );
    end

  end

  s = 1.0 / dzasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
%
%  Solve hermitian(U) * Y = W.
%
  k = 1;
  ik = 0;

  while ( k <= n )

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + conj ( ap(ik+1:ik+k-1) ) * transpose ( z(1:k-1) );
      ikp1 = ik + k;

      if ( ks == 2 )
        z(k+1) = z(k+1) ...
          + conj ( ap(ikp1+1:ikp1+k-1) ) * transpose ( z(1:k-1) );
      end

      kp = abs ( ipvt(k) );

      if ( kp ~= k )
        t     = z(k);
        z(k)  = z(kp);
        z(kp) = t;
      end

    end

    ik = ik + k;
    if ( ks == 2 )
      ik = ik + ( k + 1 );
    end

    k = k + ks;

  end

  s = 1.0 / dzasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve U*D*V = Y.
%
  k = n;
  ik = ( n * ( n - 1 ) ) / 2;

  while ( 0 < k )

    kk = ik + k;
    ikm1 = ik - ( k - 1 );

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= ks )

      kp = abs ( ipvt(k) );
      kps = k + 1 - ks;

      if ( kp ~= kps )
        t      = z(kps);
        z(kps) = z(kp);
        z(kp)  = t;
      end

      z(1:k-ks) = z(1:k-ks) + z(k) * ap(ik+1:ik+k-ks);

      if ( ks == 2 )
        z(1:k-ks) = z(1:k-ks) + z(k-1) * ap(ikm1+1:ikm1+k-ks);
      end

    end

    if ( ks ~= 2 )

      if ( zabs1 ( ap(kk) ) < zabs1 ( z(k) ) )
        s = zabs1 ( ap(kk) ) / zabs1 ( z(k) );
        z(1:n) = z(1:n) * s;
        ynorm = s * ynorm;
      end

      if ( zabs1 ( ap(kk) ) ~= 0.0 )
        z(k) = z(k) / ap(kk);
      else
        z(k) = 1.0;
      end

    else

      km1k = ik + k - 1;
      km1km1 = ikm1 + k - 1;
      ak = ap(kk) / conj ( ap(km1k) );
      akm1 = ap(km1km1) / ap(km1k);
      bk = z(k) / conj ( ap(km1k) );
      bkm1 = z(k-1) / ap(km1k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;
    ik = ik - k;

    if ( ks == 2 )
      ik = ik - ( k + 1 );
    end

  end

  s = 1.0 / dzasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve hermitian(U) * Z = V.
%
  k = 1;
  ik = 0;

  while ( k <= n )

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + conj ( ap(ik+1:ik+k-1) ) * transpose ( z(1:k-1) );
      ikp1 = ik + k;

      if ( ks == 2 )
        z(k+1) = z(k+1) ...
          + conj ( ap(ikp1+1:ikp1+k-1) ) * transpose ( z(1:k-1) );
      end

      kp = abs ( ipvt(k) );

      if ( kp ~= k )
        t     = z(k);
        z(k)  = z(kp);
        z(kp) = t;
      end

    end

    ik = ik + k;

    if ( ks == 2 )
      ik = ik + ( k + 1 );
    end

    k = k + ks;

  end
%
%  Make ZNORM = 1.
%
  s = 1.0 / dzasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;

  if ( anorm ~= 0.0 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0;
  end

  return
end
