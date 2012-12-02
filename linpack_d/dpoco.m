function [ a, rcond, z, info ] = dpoco ( a, lda, n )

%*****************************************************************************80
%
%% DPOCO factors a real symmetric positive definite matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, DPOFA is slightly faster.
%
%    To solve A*X = B, follow DPOCO by DPOSL.
%
%    To compute inverse(A)*C, follow DPOCO by DPOSL.
%
%    To compute determinant(A), follow DPOCO by DPODI.
%
%    To compute inverse(A), follow DPOCO by DPODI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2005
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
%    Input, real A(LDA,N), the symmetric matrix to be factored.  Only the 
%    diagonal and upper triangle are used.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(LDA,N), an upper triangular matrix R so that A = R'*R 
%    where R' is the transpose.  The strict lower triangle is unaltered.
%    If INFO /= 0, the factorization is not complete.
%
%    Output, real RCOND, an estimate of the reciprocal 
%    condition of A.  For the system A*X = B, relative perturbations in 
%    A and B of size EPSILON may cause relative perturbations in X of 
%    size EPSILON/RCOND.  If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular,  
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, real Z(N), a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an 
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%    If INFO /= 0, Z is unchanged.
%
%    Output, integer INFO, error flag.
%    0, for normal return.
%    K, signals an error condition.  The leading minor of order K is not 
%    positive definite.
%

%
%  Find norm of A using only upper half.
%
  for j = 1 : n
    z(j) = dasum ( j, a(1:j,j), 1 );
    for i = 1 : j-1
      z(i) = z(i) + abs ( a(i,j) );
    end
  end

  anorm = max ( z(1:n) );
%
%  Factor.
%
  [ a, info ] = dpofa ( a, lda, n );

  if ( info ~= 0 )
    return
  end
%
%  RCOND = 1/(norm(A)*(estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A*Z = Y and A*Y = E.
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

  for k = 1 : n

    if ( z(k) ~= 0.0 )
      ek = - abs ( ek ) * r8_sign ( z(k) );
    end

    if ( a(k,k) < abs ( ek - z(k) ) )
      s = a(k,k) / abs ( ek - z(k) );
      z(1:n) = s * z(1:n);
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = abs ( wk );
    sm = abs ( wkm );
    wk = wk / a(k,k);
    wkm = wkm / a(k,k);

    if ( k + 1 <= n )

      for j = k+1 : n
        sm = sm + abs ( z(j) + wkm * a(k,j) );
        z(j) = z(j) + wk * a(k,j);
        s = s + abs ( z(j) );
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        z(k+1:n) = z(k+1:n) + t * a(k,k+1:n);
      end

    end

    z(k) = wk;

  end

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );
%
%  Solve R * Y = W.
%
  for k = n : -1 : 1

    if ( a(k,k) < abs ( z(k) ) )
      s = a(k,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
    end

    z(k) = z(k) / a(k,k);
    t = -z(k);
    z(1:k-1) = daxpy ( k-1, t, a(1:k-1,k)', 1, z(1:k-1), 1 );

  end

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );
  ynorm = 1.0;
%
%  Solve R' * V = Y.
%
  for k = 1 : n

    z(k) = z(k) - ddot ( k-1, a(1:k-1,k), 1, z(1:k-1), 1 );

    if ( a(k,k) < abs ( z(k) ) )
      s = a(k,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / a(k,k);

  end

  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;
%
%  Solve R * Z = V.
%
  for k = n : -1 : 1

    if ( a(k,k) < abs ( z(k) ) )
      s = a(k,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / a(k,k);
    t = -z(k);
    z(1:k-1) = daxpy ( k-1, t, a(1:k-1,k)', 1, z(1:k-1), 1 );

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
