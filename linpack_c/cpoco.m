function [ a, rcond, info ] = cpoco ( a, lda, n )

%*****************************************************************************80
%
%% CPOCO factors a complex hermitian positive definite matrix.
%
%  Discussion:
%
%    The routine also estimates the condition of the matrix.
%
%    If RCOND is not needed, CPOFA is slightly faster.
%
%    To solve A*X = B, follow CPOCO by CPOSL.
%
%    To compute inverse(A)*C, follow CPOCO by CPOSL.
%
%    To compute determinant(A), follow CPOCO by CPODI.
%
%    To compute inverse(A), follow CPOCO by CPODI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2007
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
%    Input, complex A(LDA,N), the hermitian matrix to be factored.  
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(LDA,N); an upper triangular matrix R so that  
%      A = hermitian(R)*R 
%    where hermitian(R) is the conjugate transpose.  The strict lower 
%    triangle is unaltered.  If INFO ~= 0, the factorization is not complete.
%
%    Output, real RCOND, an estimate of the reciprocal condition of 
%    the matrix.  For the system A*X = B, relative perturbations in A and B 
%    of size EPSILON may cause relative perturbations in X of size
%    (EPSILON/RCOND).  If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular, 
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, integer INFO.
%    0, for normal return.
%    K, signals an error condition.  The leading minor of order K is not 
%    positive definite.
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
  [ a, info ] = cpofa ( a, lda, n );

  if ( info ~= 0 )
    return;
  end
%
%  RCOND = 1/(norm(A)*(estimate of norm(inverse(A)))).
%
%  Estimate = norm(Z)/norm(Y) where A*Z = Y and A*Y = E.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of W where hermitian(R)*W = E.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve hermitian(R)*W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  for k = 1 : n

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( real ( a(k,k) ) < cabs1 ( ek - z(k) ) )
      s = real ( a(k,k) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );
    wk = wk / a(k,k);
    wkm = wkm / a(k,k);
    kp1 = k + 1;

    if ( kp1 <= n )

      for j = kp1 : n
        sm = sm + cabs1 ( z(j) + wkm * conj ( a(k,j) ) );
        z(j) = z(j) + wk * conj ( a(k,j) );
        s = s + cabs1 ( z(j) );
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        z(kp1:n) = z(kp1:n) + t * conj ( a(k,kp1:n) );
      end

    end

    z(k) = wk;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
%
%  Solve R * Y = W.
%
  for k = n : -1 : 1

    if ( real ( a(k,k) ) < cabs1 ( z(k) ) )
      s = real ( a(k,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
    end

    z(k) = z(k) / a(k,k);
    t = -z(k);
    z(1:k-1) = z(1:k-1) + t * transpose ( a(1:k-1,k) );

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve hermitian(R) * V = Y.
%
  for k = 1 : n

    z(k) = z(k) - z(1:k-1) * conj ( a(1:k-1,k) );

    if ( real ( a(k,k) ) < cabs1 ( z(k) ) )
      s = real ( a(k,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / a(k,k);

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve R * Z = V.
%
  for k = n: -1 : 1

    if ( real ( a(k,k) ) < cabs1 ( z(k) ) )
      s = real ( a(k,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / a(k,k);
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
