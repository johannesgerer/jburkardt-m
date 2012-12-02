function [ ap, rcond, z, info ] = dppco ( ap, n )

%*****************************************************************************80
%
%% DPPCO factors a real symmetric positive definite matrix in packed form.
%
%  Discussion:
%
%    DPPCO also estimates the condition of the matrix.
%
%    If RCOND is not needed, DPPFA is slightly faster.
%
%    To solve A*X = B, follow DPPCO by DPPSL.
%
%    To compute inverse(A)*C, follow DPPCO by DPPSL.
%
%    To compute determinant(A), follow DPPCO by DPPDI.
%
%    To compute inverse(A), follow DPPCO by DPPDI.
%
%  Packed storage:
%
%    The following program segment will pack the upper triangle of
%    a symmetric matrix.
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
%    Input, real AP(N*(N+1)/2), the packed form of a symmetric matrix A.  
%    The columns of the upper triangle are stored sequentially in a 
%    one-dimensional array.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real AP(N*(N+1)/2), an upper riangular matrix R, stored
%    in packed form, so that A = R'*R.  If INFO /= 0, the factorization 
%    is not complete.
%
%    Output, real RCOND, an estimate of the reciprocal condition
%    of A.  For the system A*X = B, relative perturbations in A and B of size
%    EPSILON may cause relative perturbations in X of size EPSILON/RCOND.
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0D+00
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, real Z(N), a work vector whose contents are usually
%    unimportant.  If A is singular to working precision, then Z is an
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%    If INFO /= 0, Z is unchanged.
%
%    Output, integer INFO, error flag.
%    0, for normal return.
%    K, signals an error condition.  The leading minor of order K is
%    not positive definite.
%

%
%  Find the norm of A.
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
  [ ap, info ] = dppfa ( ap, n );

  if ( info ~= 0 )
    return
  end
%
%  RCOND = 1/(norm(A)*(estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A * Z = Y and A * Y = E.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of W where R'*W = E.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve R' * W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  kk = 0;

  for k = 1 : n

    kk = kk + k;

    if ( z(k) ~= 0.0 )
      ek = -abs ( ek ) * r8_sign ( z(k) );
    end

    if ( ap(kk) < abs ( ek - z(k) ) )
      s = ap(kk) / abs ( ek - z(k) );
      z(1:n) = s * z(1:n);
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = abs ( wk );
    sm = abs ( wkm );
    wk = wk / ap(kk);
    wkm = wkm / ap(kk);
    kj = kk + k;

    if ( k + 1 <= n )

      for j = k + 1 : n
        sm = sm + abs ( z(j) + wkm * ap(kj) );
        z(j) = z(j) + wk * ap(kj);
        s = s + abs ( z(j) );
        kj = kj + j;
      end

      if ( s < sm )

        t = wkm - wk;
        wk = wkm;
        kj = kk + k;

        for j = k+1 : n
          z(j) = z(j) + t * ap(kj);
          kj = kj + j;
        end

      end

    end

    z(k) = wk;

  end

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );
%
%  Solve R * Y = W.
%
  for k = n : -1 : 1

    if ( ap(kk) < abs ( z(k) ) );
      s = ap(kk) / abs ( z(k) );
      z(1:n) = s * z(1:n);
    end

    z(k) = z(k) / ap(kk);
    kk = kk - k;
    t = -z(k);
    z(1:k-1) = daxpy ( k-1, t, ap(kk+1:kk+k-1), 1, z(1:k-1), 1 );

  end

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );

  ynorm = 1.0;
%
%  Solve R' * V = Y.
%
  for k = 1 : n

    z(k) = z(k) - ddot ( k-1, ap(kk+1:kk+k-1), 1, z(1:k-1), 1 );
    kk = kk + k;

    if ( ap(kk) < abs ( z(k) ) )
      s = ap(kk) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / ap(kk);

  end

  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;
%
%  Solve R * Z = V.
%
  for k = n : -1 : 1

    if ( ap(kk) < abs ( z(k) ) )
      s = ap(kk) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / ap(kk);
    kk = kk - k;
    t = -z(k);
    z(1:k-1) = daxpy ( k-1, t, ap(kk+1:kk+k-1), 1, z(1:k-1), 1 );

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
