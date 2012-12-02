function [ a, ipvt, rcond ] = cgeco ( a, lda, n )

%*****************************************************************************80
%
%% CGECO factors a complex matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, CGEFA is slightly faster.
%
%    To solve A*X = B, follow CGECO by CGESL.
%
%    To compute inverse(A)*C, follow CGECO by CGESL.
%
%    To compute determinant(A), follow CGECO by CGEDI.
%
%    To compute inverse(A), follow CGECO by CGEDI.
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
%    Input, complexA(LDA,N), the matrix to be factored.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N), an upper triangular matrix and the multipliers 
%    which were used to obtain it.  The factorization can be written A = L*U 
%    where L is a product of permutation and unit lower triangular matrices 
%    and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition of A.
%    For the system A*X = B, relative perturbations in A and B of size 
%    EPSILON may cause relative perturbations in X of size (EPSILON/RCOND).
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate
%    underflows.
%

%
%  Compute the 1-norm of A.
%
  anorm = 0.0;
  for j = 1 : n
    anorm = max ( anorm, scasum ( n, a(1:n,j), 1 ) );
  end
%
%  Factor.
%
  [ a, ipvt, info ] = cgefa ( a, lda, n );
%
%  RCOND = 1/(norm(A)*(estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A*Z = Y and hermitian(A)*Y = E.
%
%  Hermitian(A) is the conjugate transpose of A.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of W where hermitian(U)*W = E.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve hermitian(U)*W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  for k = 1 : n

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( cabs1 ( a(k,k) ) < cabs1 ( ek - z(k) ) )
      s = cabs1 ( a(k,k) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );

    if ( cabs1 ( a(k,k) ) ~= 0.0 )
      wk = wk / conj ( a(k,k) );
      wkm = wkm / conj ( a(k,k) );
    else
      wk = 1.0;
      wkm =1.0;
    end

    for j = k+1 : n
      sm = sm + cabs1 ( z(j) + wkm * conj ( a(k,j) ) );
      z(j) = z(j) + wk * conj ( a(k,j) );
      s = s + cabs1 ( z(j) );
    end

    if ( s < sm )
      t = wkm - wk;
      wk = wkm;
      z(k+1:n) = z(k+1:n) + t * conj ( a(k,k+1:n) );
    end

    z(k) = wk;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
%
%  Solve hermitian(L) * Y = W.
%
  for k = n : -1 : 1

    if ( k < n )
      z(k) = z(k) + z(k+1:n) * conj ( a(k+1:n,k) );
    end

    if ( 1.0 < cabs1 ( z(k) ) )
      s = 1.0 / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
    end

    l = ipvt(k);

    t    = z(l);
    z(l) = z(k);
    z(k) = t;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve L * V = Y.
%
  for k = 1 : n

    l = ipvt(k);

    t    = z(l);
    z(l) = z(k);
    z(k) = t;

    if ( k < n )
      z(k+1:n) = z(k+1:n) + t * transpose ( a(k+1:n,k) );
    end

    if ( 1.0 < cabs1 ( z(k) ) )
      s = 1.0 / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve U * Z = V.
%
  for k = n : -1 : 1

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

    t = -z(k);
    z(1:k-1) = z(1:k-1) + t * transpose ( a(1:k-1,k) );

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
