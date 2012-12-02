function [ a, kpvt, rcond, z ] = ssico ( a, lda, n )

%*****************************************************************************80
%
%% SSICO factors a real symmetric matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, SSIFA is slightly faster.
%
%    To solve A * X = B, follow SSICO by SSISL.
%
%    To compute inverse(A)*C, follow SSICO by SSISL.
%
%    To compute inverse(A), follow SSICO by SSIDI.
%
%    To compute determinant(A), follow SSICO by SSIDI.
%
%    To compute inertia(A), follow SSICO by SSIDI.
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
%    Output, integer KPVT(N), pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition
%    of A.  For the system A*X = B, relative perturbations in A and B of size
%    EPSILON may cause relative perturbations in X of size EPSILON/RCOND.
%    If RCOND is so small that the logical expression
%      1.0D+00 + RCOND == 1.0D+00
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, real Z(N), a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%

%
%  Find the norm of A, using only entries in the upper half of the matrix.
%
  for j = 1 : n
    z(j) = sasum ( j, a(1:j,j), 1 );
    for i = 1 : j-1
      z(i) = z(i) + abs ( a(i,j) );
    end
  end

  anorm = max ( z(1:n) );
%
%  Factor.
%
  [ a, kpvt, info ] = ssifa ( a, lda, n );
%
%  RCOND = 1/(norm(A)*(estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A*Z = Y and A*Y = E.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of W where U*D*W = E.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve U * D * W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;
  k = n;

  while ( k ~= 0 )

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    kp = abs ( kpvt(k) );
    kps = k + 1 - ks;

    if ( kp ~= kps )
      t = z(kps);
      z(kps) = z(kp);
      z(kp) = t;
    end

    if ( z(k) ~= 0.0 )
      ek = abs ( ek ) * r4_sign ( z(k) );
    end

    z(k) = z(k) + ek;
    z(1:k-ks) = saxpy ( k-ks, z(k), a(1:k-ks,k)', 1, z(1:k-ks), 1 );

    if ( ks ~= 1 )
      if ( z(k-1) ~= 0.0 )
        ek = abs ( ek ) * r4_sign ( z(k-1) );
      end
      z(k-1) = z(k-1) + ek;
      z(1:k-ks) = saxpy ( k-ks, z(k-1), a(1:k-ks,k-1), 1, z(1:k-ks), 1 );
    end 

    if ( ks ~= 2 )

      if ( abs ( a(k,k) ) < abs ( z(k) ) )
        s = abs ( a(k,k) ) / abs ( z(k) );
        z(1:n) = s * z(1:n);
        ek = s * ek;
      end

      if ( a(k,k) ~= 0.0 )
        z(k) = z(k) / a(k,k);
      else
        z(k) = 1.0;
      end

    else

      ak = a(k,k) / a(k-1,k);
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = z(k) / a(k-1,k);
      bkm1 = z(k-1) / a(k-1,k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;

  end

  z(1:n) = z(1:n) / sasum ( n, z(1:n), 1 );
%
%  Solve U' * Y = W.
%
  k = 1;

  while ( k <= n )

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + sdot ( k-1, a(1:k-1,k), 1, z(1:k-1), 1 );

      if ( ks == 2 )
        z(k+1) = z(k+1) + sdot ( k-1, a(1:k-1,k+1), 1, z(1:k-1), 1 );
      end

      kp = abs ( kpvt(k) );

      if ( kp ~= k )
        t = z(k);
        z(k) = z(kp);
        z(kp) = t;
      end

    end

    k = k + ks;

  end

  z(1:n) = z(1:n) / sasum ( n, z, 1 );

  ynorm = 1.0;
%
%  Solve U * D * V = Y.
%
  k = n;

  while ( k ~= 0 )

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= ks )

      kp = abs ( kpvt(k) );
      kps = k + 1 - ks;

      if ( kp ~= kps )
        t = z(kps);
        z(kps) = z(kp);
        z(kp) = t;
      end

      z(1:k-ks) = saxpy ( k-ks, z(k), a(1:k-ks,k)', 1, z(1:k-ks), 1 );

      if ( ks == 2 )
        z(1:k-ks) = saxpy ( k-ks, z(k-1), a(1:k-ks,k-1)', 1, z(1:k-ks), 1 );
      end

    end

    if ( ks ~= 2 )

      if ( abs ( a(k,k) ) < abs ( z(k) ) )
        s = abs ( a(k,k) ) / abs ( z(k) );
        z(1:n) = s * z(1:n);
        ynorm = s * ynorm;
      end

      if ( a(k,k) ~= 0.0 )
        z(k) = z(k) / a(k,k);
      else
        z(k) = 1.0;
      end

    else

      ak = a(k,k) / a(k-1,k);
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = z(k) / a(k-1,k);
      bkm1 = z(k-1) / a(k-1,k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;

  end

  s = 1.0 / sasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;
%
%  Solve U' * Z = V.
%
  k = 1;

  while ( k <= n )

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + sdot ( k-1, a(1:k-1,k), 1, z(1:k-1), 1 );
      if ( ks == 2 )
        z(k+1) = z(k+1) + sdot ( k-1, a(1:k-1,k+1), 1, z(1:k-1), 1 );
      end
      kp = abs ( kpvt(k) );

      if ( kp ~= k )
        t = z(k);
        z(k) = z(kp);
        z(kp) = t;
      end

    end

    k = k + ks;

  end
%
%  Make ZNORM = 1.0.
%
  s = 1.0 / sasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;

  if ( anorm ~= 0.0 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0;
  end

  return
end
