function [ a, ipvt, rcond ] = chico ( a, lda, n )

%*****************************************************************************80
%
%% CHICO factors a complex hermitian matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, CHIFA is slightly faster.
%
%    To solve A*X = B, follow CHICO by CHISL.
%
%    To compute inverse(A)*C, follow CHICO by CHISL.
%
%    To compute inverse(A), follow CHICO by CHIDI.
%
%    To compute determinant(A), follow CHICO by CHIDI.
%
%    To compute inertia(A), follow CHICO by CHIDI.
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
%    Input, complex A(LDA,N); on input, the hermitian matrix to be
%    factored.  
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N); a block diagonal matrix and the multipliers
%    which were used to obtain it.  The factorization can be written
%    A = U*D*hermitian(U) where U is a product of permutation and unit
%    upper triangular matrices, hermitian(U) is the conjugate transpose 
%    of U, and D is block diagonal with 1 by 1 and 2 by 2 blocks.  
%    Only the diagonal and upper triangle are used.
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
  for j = 1 : n

    z(j) = scasum ( j, a(1:j,j), 1 );

    for i = 1 : j - 1
      z(i) = real ( z(i) ) + cabs1 ( a(i,j) );
    end

  end

  anorm = 0.0;
  for j = 1 : n
    anorm = max ( anorm, real ( z(j) ) );
  end
%
%  Factor.
%
  [ a, ipvt, info ] = chifa ( a, lda, n );
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
%  Solve U*D*W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  k = n;

  while ( 0 < k )

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

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, z(k) );
    end

    z(k) = z(k) + ek;
    z(1:k-ks) = z(1:k-ks) + z(k) * transpose ( a(1:k-ks,k) );

    if ( ks ~= 1 )

      if ( cabs1 ( z(k-1) ) ~= 0.0 )
        ek = csign1 ( ek, z(k-1) );
      end

      z(k-1) = z(k-1) + ek;
      z(1:k-ks) = z(1:k-ks) + z(k-1) * a(1:k-ks,k-1);

    end

    if ( ks ~= 2 )

      if ( cabs1 ( a(k,k) ) < cabs1 ( z(k) ) )
        s = cabs1 ( a(k,k) ) / cabs1 ( z(k) );
        z(1:n) = z(1:n) * s;
        ek = s * ek;
      end

      if ( cabs1 ( a(k,k) ) ~= 0.0 )
        z(k) = z(k) / a(k,k);
      else
        z(k) = 1.0;
      end

    else

      ak = a(k,k) / conj ( a(k-1,k) );
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = z(k) / conj ( a(k-1,k) );
      bkm1 = z(k-1) / a(k-1,k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
%
%  Solve hermitian(U) * Y = W.
%
  k = 1;

  while ( k <= n ) 

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + z(1:k-1) * conj ( a(1:k-1,k) );

      if ( ks == 2 )
        z(k+1) = z(k+1) + z(1:k-1) * conj ( a(1:k-1,k+1) );
      end

      kp = abs ( ipvt(k) );

      if ( kp ~= k )
        t     = z(k);
        z(k)  = z(kp);
        z(kp) = t;
      end

    end

    k = k + ks;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve U*D*V = Y.
%
  k = n;

  while ( 0 < k ) 

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

      z(1:k-ks) = z(1:k-ks) + z(k) * transpose ( a(1:k-ks,k) );

      if ( ks == 2 )
        z(1:k-ks) = z(1:k-ks) + z(k-1) * a(1:k-ks,k-1);
      end

    end

    if ( ks ~= 2 )

      if ( cabs1 ( a(k,k) ) < cabs1 ( z(k) ) )
        s = cabs1 ( a(k,k) ) / cabs1 ( z(k) );
        z(1:n) = z(1:n) * s;
        ynorm = s * ynorm;
      end

      if ( cabs1 ( a(k,k) ) ~= 0.0 )
        z(k) = z(k) / a(k,k);
      else
        z(k) = 1.0;
      end

    else

      ak = a(k,k) / conj ( a(k-1,k) );
      akm1 = a(k-1,k-1) / a(k-1,k);
      bk = z(k) / conj ( a(k-1,k) );
      bkm1 = z(k-1) / a(k-1,k);
      denom = ak * akm1 - 1.0;
      z(k) = ( akm1 * bk - bkm1 ) / denom;
      z(k-1) = ( ak * bkm1 - bk ) / denom;

    end

    k = k - ks;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve hermitian(U) * Z = V.
%
  k = 1;

  while ( k <= n )

    if ( ipvt(k) < 0 )
      ks = 2;
    else
      ks = 1;
    end

    if ( k ~= 1 )

      z(k) = z(k) + z(1:k-1) * conj ( a(1:k-1,k) );

      if ( ks == 2 )
        z(k+1) = z(k+1) + z(1:k-1) *  conj ( a(1:k-1,k+1) );
      end

      kp = abs ( ipvt(k) );

      if ( kp ~= k )
        t     = z(k);
        z(k)  = z(kp);
        z(kp) = t;
      end

    end

    k = k + ks;

  end
%
%  Make ZNORM = 1.
%
  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;

  if ( anorm ~= 0.0 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0;
  end

  return
end
