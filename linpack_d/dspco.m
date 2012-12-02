function [ ap, kpvt, rcond, z ] = dspco ( ap, n )

%*****************************************************************************80
%
%% DSPCO factors a real symmetric matrix stored in packed form.
%
%  Discussion:
%
%    DSPCO uses elimination with symmetric pivoting and estimates
%    the condition of the matrix.
%
%    If RCOND is not needed, DSPFA is slightly faster.
%
%    To solve A*X = B, follow DSPCO by DSPSL.
%
%    To compute inverse(A)*C, follow DSPCO by DSPSL.
%
%    To compute inverse(A), follow DSPCO by DSPDI.
%
%    To compute determinant(A), follow DSPCO by DSPDI.
%
%    To compute inertia(A), follow DSPCO by DSPDI.
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
%    Input, real AP(N*(N+1)/2), the packed form of a symmetric matrix A.  The 
%    columns of the upper triangle are stored sequentially in a one-dimensional array.  
%
%    Input, integer N, the order of the matrix.
%
%    Output, real AP(N*(N+1)/2), a block diagonal matrix and the multipliers 
%    which were used to obtain it, stored in packed form.  The 
%    factorization can be written A = U*D*U' where U is a product of 
%    permutation and unit upper triangular matrices, U' is the transpose 
%    of U, and D is block diagonal with 1 by 1 and 2 by 2 blocks.
%
%    Output, integer KPVT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition
%    of A.  For the system A*X = B, relative perturbations in A and B of size  
%    EPSILON may cause relative perturbations in X of size EPSILON/RCOND.
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular,  
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, real Z(N) a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an 
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%

%
%  Find norm of A using only upper half.
%
  j1 = 1;
  for j = 1 : n
    z(j) = dasum ( j, ap(j1:j1+j-1), 1 );
    ij = j1;
    j1 = j1 + j;
    for i = 1 : j-1
      z(i) = z(i) + abs ( ap(ij) );
      ij = ij + 1;
    end
  end

  anorm = max ( z(1:n) );
%
%  Factor.
%
  [ ap, kpvt, info ] = dspfa ( ap, n );
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
  ik = floor ( ( n * ( n - 1 ) ) / 2 );

  while ( k ~= 0 ) 

    kk = ik + k;
    ikm1 = ik - ( k - 1 );

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
      ek = abs ( ek ) * r8_sign ( z(k) );
    end

    z(k) = z(k) + ek;
    z(1:k-ks) = daxpy ( k-ks, z(k), ap(ik+1:ik+k-ks), 1, z(1:k-ks), 1 );

    if ( ks ~= 1 )
      if ( z(k-1) ~= 0.0 )
        ek = abs ( ek ) * r8_sign ( z(k-1) );
      end
      z(k-1) = z(k-1) + ek;
      z(1:k-ks) = daxpy ( k-ks, z(k-1), ap(ikm1+1:ikm1+k-ks), 1, z(1:k-ks), 1 );
    end

    if ( ks ~= 2 )

      if ( abs ( ap(kk) ) < abs ( z(k) ) )
        s = abs ( ap(kk) ) / abs ( z(k) );
        z(1:n) = s * z(1:n);
        ek = s * ek;
      end

      if ( ap(kk) ~= 0.0 )
        z(k) = z(k) / ap(kk);
      else
        z(k) = 1.0;
      end

    else

      km1k = ik + k - 1;
      km1km1 = ikm1 + k - 1;
      ak = ap(kk) / ap(km1k);
      akm1 = ap(km1km1) / ap(km1k);
      bk = z(k) / ap(km1k);
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

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );
%
%  Solve U' * Y = W.
%
  k = 1;
  ik = 0;

  while ( k <= n ) 

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + ddot ( k-1, ap(ik+1:ik+k-1), 1, z(1:k-1), 1 );
      ikp1 = ik + k;

      if ( ks == 2 )
        z(k+1) = z(k+1) + ddot ( k-1, ap(ikp1+1:ikp1+k-1), 1, z(1:k-1), 1 );
      end

      kp = abs ( kpvt(k) );

      if ( kp ~= k )
        t = z(k);
        z(k) = z(kp);
        z(kp) = t;
      end

    end

    ik = ik + k;
    if ( ks == 2 )
      ik = ik + ( k + 1 );
    end
    k = k + ks;
  
  end

  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = 1.0;
%
%  Solve U * D * V = Y.
%
  k = n;

  ik = floor ( n * ( n - 1 ) / 2 );

  while ( 0 < k )

    kk = ik + k;
    ikm1 = ik - ( k - 1 );

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

      z(1:k-ks) = daxpy ( k-ks, z(k), ap(ik+1:ik+k-ks), 1, z(1:k-ks), 1 );

      if ( ks == 2 )
        z(1:k-ks) = daxpy ( k-ks, z(k-1), ap(ikm1+1:ikm1+k-ks), 1, z(1:k-ks), 1 );
      end

    end

    if ( ks ~= 2 )

      if ( abs ( ap(kk) ) < abs ( z(k) ) )
        s = abs ( ap(kk) ) / abs ( z(k) );
        z(1:n) = s * z(1:n);
        ynorm = s * ynorm;
      end

      if ( ap(kk) ~= 0.0 )
        z(k) = z(k) / ap(kk);
      else
        z(k) = 1.0;
      end

    else

      km1k = ik + k - 1;
      km1km1 = ikm1 + k - 1;
      ak = ap(kk) / ap(km1k);
      akm1 = ap(km1km1) / ap(km1k);
      bk = z(k) / ap(km1k);
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

  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;
%
%  Solve U' * Z = V.
%
  k = 1;
  ik = 0;

  while ( k <= n )

    if ( kpvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + ddot ( k-1, ap(ik+1:ik+k-1), 1, z(1:k-1), 1 );
      ikp1 = ik + k;

      if ( ks == 2 )
        z(k+1) = z(k+1) + ddot ( k-1, ap(ikp1+1:ikp1+k-1), 1, z(1:k-1), 1 );
      end

      kp = abs ( kpvt(k) );

      if ( kp ~= k )
        t = z(k);
        z(k) = z(kp);
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
%  Make ZNORM = 1.0.
%
  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;

  if ( anorm ~= 0.0 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0;
  end

  return
end
