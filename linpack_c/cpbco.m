function [ abd, rcond, info ] = cpbco ( abd, lda, n, m )

%*****************************************************************************80
%
%% CPBCO factors a complex hermitian positive definite band matrix.
%
%  Discussion:
%
%    The routine also estimates the condition number of the matrix.
%
%    If RCOND is not needed, CPBFA is slightly faster.
%
%    To solve A*X = B, follow CPBCO by CPBSL.
%
%    To compute inverse(A)*C, follow CPBCO by CPBSL.
%
%    To compute determinant(A), follow CPBCO by CPBDI.
%
%  Band storage:
%
%    If A is a hermitian positive definite band matrix,
%    the following program segment will set up the input.
%
%      m = (band width above diagonal)
%      do j = 1, n
%        i1 = max ( 1, j-m )
%        do i = i1, j
%          k = i-j+m+1
%          abd(k,j) = a(i,j)
%        end
%      end
%
%    This uses M+1 rows of A, except for the M by M
%    upper left triangle, which is ignored.
%
%  Example:
%
%    If the original matrix is
%
%      11 12 13  0  0  0
%      12 22 23 24  0  0
%      13 23 33 34 35  0
%       0 24 34 44 45 46
%       0  0 35 45 55 56
%       0  0  0 46 56 66
%
%    then N = 6, M = 2 and ABD should contain
%
%       *  * 13 24 35 46
%       * 12 23 34 45 56
%      11 22 33 44 55 66
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
%    Input/output, complex ABD(LDA,N); on input, the matrix to be factored.
%    The columns of the upper triangle are stored in the columns of ABD,
%    and the diagonals of the upper triangle are stored in the rows of ABD.
%
%    Input, integer LDA, the leading dimension of ABD.
%    LDA must be at least M+1.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%    0 <= M < N.
%
%    Output, complex ABD(LDA,N);an upper triangular matrix R, stored in band
%    form, so that A = hermitian(R) * R.  If INFO ~= 0, the factorization 
%    is not complete.
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
%  Local parameters:
%
%    Local, complex Z(N), a work vector whose contents are usually
%    unimportant.  If A is singular to working precision, then Z is
%    an approximate null vector in the sense that
%    norm ( A * Z ) = RCOND * norm ( A ) * norm ( Z ).
%    If INFO ~= 0, Z is unchanged.
%

%
%  Find the norm of A.
%
  for j = 1 : n

    l = min ( j, m + 1 );
    mu = max ( m + 2 - j, 1 );
    z(j) = scasum ( l, abd(mu:mu+l-1,j), 1 );
    k = j - l;

    for i = mu : m
      k = k + 1;
      z(k) = real ( z(k) ) + cabs1 ( abd(i,j) );
    end

  end

  anorm = 0.0;
  for j = 1 : n
    anorm = max ( anorm, real ( z(j) ) );
  end
%
%  Factor.
%
  [ abd, info ] = cpbfa ( abd, lda, n, m );

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

  for k = 1 : n

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( real ( abd(m+1,k) ) < cabs1 ( ek - z(k) ) )
      s = real ( abd(m+1,k) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = - ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );
    wk = wk / abd(m+1,k);
    wkm = wkm / abd(m+1,k);
    j2 = min ( k + m, n );
    i = m + 1;

    if ( k+1 <= j2 )

      for j = k+1 : j2
        i = i - 1;
        sm = sm + cabs1 ( z(j) + wkm * conj ( abd(i,j) ) );
        z(j) = z(j) + wk * conj ( abd(i,j) );
        s = s + cabs1 ( z(j) );
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        i = m + 1;
        for j = k+1 : j2
          i = i - 1;
          z(j) = z(j) + t * conj ( abd(i,j) );
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

    if ( real ( abd(m+1,k) ) < cabs1 ( z(k) ) )
      s = real ( abd(m+1,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
    end

    z(k) = z(k) / abd(m+1,k);
    lm = min ( k - 1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = -z(k);
    z(lb:lb+lm-1) = z(lb:lb+lm-1) + t * transpose ( abd(la:la+lm-1,k) );

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve hermitian(R)*V = Y.
%
  for k = 1 : n

    lm = min ( k - 1, m );
    la = m + 1 - lm;
    lb = k - lm;
    z(k) = z(k) - abd(la:la+lm-1,k)' * transpose ( z(lb:lb+lm-1) );

    if ( real ( abd(m+1,k) ) < cabs1 ( z(k) ) )
      s = real ( abd(m+1,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / abd(m+1,k);

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;
%
%  Solve R * Z = W.
%
  for k = n : -1 : 1

    if ( real ( abd(m+1,k) ) < cabs1 ( z(k) ) )
      s = real ( abd(m+1,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    z(k) = z(k) / abd(m+1,k);
    lm = min ( k - 1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = -z(k);
    z(lb:lb+lm-1) = z(lb:lb+lm-1) + t * transpose ( abd(la:la+lm-1,k) );

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
