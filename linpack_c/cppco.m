function [ ap, rcond, info ] = cppco ( ap, n )

%*****************************************************************************80
%
%% CPPCO factors a complex hermitian positive definite matrix.
%
%  Discussion:
%
%    The routine also estimates the condition of the matrix.
%
%    The matrix is stored in packed form.
%
%    If RCOND is not needed, CPPFA is slightly faster.
%
%    To solve A*X = B, follow CPPCO by CPPSL.
%
%    To compute inverse(A)*C, follow CPPCO by CPPSL.
%
%    To compute determinant(A), follow CPPCO by CPPDI.
%
%    To compute inverse(A), follow CPPCO by CPPDI.
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
%    13 May 2006
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
%    Input, complex AP(N*(N+1)/2), the packed form of a 
%    hermitian matrix.  The columns of the upper triangle are stored 
%    sequentially in a one-dimensional array.  
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex AP(N*(N+1)/2);  an upper 
%    triangular matrix R, stored in packed form, so that A = hermitian(R) * R.
%    If INFO ~= 0 , the factorization is not complete.
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
  rcond = 0.0;
%
%  Find norm of A.
%
  j1 = 1;

  for j = 1 : n

    z(j) = scasum ( j, ap(j1:j1+j-1), 1 );
    ij = j1;
    j1 = j1 + j;

    for i = 1 : j-1
      z(i) = real ( z(i) ) + cabs1 ( ap(ij) );
      ij = ij + 1;
    end
 
  end

  anorm = max ( real ( z(1:n) ) );
%
%  Factor.
%
  [ ap, info ] = cppfa ( ap, n );

  if ( info ~= 0 )
    return
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

  kk = 0;

  for k = 1 : n

    kk = kk + k;

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( real ( ap(kk) ) < cabs1 ( ek - z(k) ) )
      s = real ( ap(kk) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );
    wk = wk / ap(kk);
    wkm = wkm / ap(kk);
    kj = kk + k;

    if ( k+1 <= n )

      for j = k+1 : n
        sm = sm + cabs1 ( z(j) + wkm * conj ( ap(kj) ) );
        z(j) = z(j) + wk * conj ( ap(kj) );
        s = s + cabs1 ( z(j) );
        kj = kj + j;
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        kj = kk + k;
        for j = k+1 : n
          z(j) = z(j) + t * conj ( ap(kj) );
          kj = kj + j;
        end
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

    if ( real ( ap(kk) ) < cabs1 ( z(k) ) )
      s = real ( ap(kk) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
    end

    z(k) = z(k) / ap(kk);
    kk = kk - k;
    t = -z(k);
    z(1:k-1) = z(1:k-1) + t * ap(kk+1:kk+k-1);

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve hermitian(R) * V = Y.
%
  for k = 1 : n

    z(k) = z(k) - conj ( ap(kk+1:kk+k-1) ) * transpose ( z(1:k-1) );
    kk = kk + k;

    if ( real ( ap(kk) ) < cabs1 ( z(k) ) )
      s = real ( ap(kk) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / ap(kk);

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve R * Z = V.
%
  for k = n : -1 : 1

    if ( real ( ap(kk) ) < cabs1 ( z(k) ) )
      s = real ( ap(kk) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / ap(kk);
    kk = kk - k;
    t = -z(k);
    z(1:k-1) = z(1:k-1) + t * ap(kk+1:kk+k-1);

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
