function [ abd, ipvt, rcond ] = cgbco ( abd, lda, n, ml, mu )

%*****************************************************************************80
%
%% CGBCO factors a complex band matrix and estimates its condition.
%
%  Discussion:
%
%    If RCOND is not needed, CGBFA is slightly faster.
%
%    To solve A*X = B, follow CGBCO by CGBSL.
%
%    To compute inverse(A)*C, follow CGBCO by CGBSL.
%
%    To compute determinant(A), follow CGBCO by CGBDI.
%
%  Band storage:
%
%    If A is a band matrix, the following program segment
%    will set up the input.
%
%      ml = (band width below the diagonal)
%      mu = (band width above the diagonal)
%      m = ml + mu + 1
%      do j = 1, n
%        i1 = max ( 1, j - mu )
%        i2 = min ( n, j + ml )
%        do i = i1, i2
%          k = i - j + m
%          abd(k,j) = a(i,j)
%        end
%      end
%
%    This uses rows ML+1 through 2*ML+MU+1 of ABD.
%    In addition, the first ML rows in ABD are used for
%    elements generated during the triangularization.
%    The total number of rows needed in ABD is 2*ML+MU+1.
%    The ML+MU by ML+MU upper left triangle and the
%    ML by ML lower right triangle are not referenced.
%
%  Example:
%
%    If the original matrix A is
%
%      11 12 13  0  0  0
%      21 22 23 24  0  0
%       0 32 33 34 35  0
%       0  0 43 44 45 46
%       0  0  0 54 55 56
%       0  0  0  0 65 66
%
%     Then N = 6, ML = 1, MU = 2, 5 <= LDA and ABD should contain
%
%       *  *  *  +  +  + 
%       *  * 13 24 35 46
%       * 12 23 34 45 56
%      11 22 33 44 55 66
%      21 32 43 54 65  *
%
%    * = not used,
%    + = used for pivoting.
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
%    Input, complex ABD(LDA,N), the matrix in band storage.  The columns of 
%    the matrix are stored in the columns of ABD and the diagonals of the 
%    matrix are stored in rows ML+1 through 2*ML+MU+1 of ABD.  
%
%    Input, integer LDA, the leading dimension of ABD.
%    LDA must be at least 2*ML+MU+1.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the number of diagonals below the main diagonal.
%    0 <= ML < N.
%
%    Input, integer MU, the number of diagonals above the main diagonal.
%    0 <= MU < N.
%    More efficient if ML <= MU.
%
%    Output, complex ABD(LDA,N), an upper triangular matrix 
%    in band storage and the multipliers which were used to obtain it.
%    The factorization can be written A = L*U where L is a product of 
%    permutation and unit lower triangular matrices and U is upper triangular.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition of A.
%    For the system A*X = B, relative perturbations in A and B of size
%    epsilon may cause relative perturbations in X of size (EPSILON/RCOND).
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate
%    underflows.
%
%  Local Parameters:
%
%    Local, complex Z(N), a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an 
%    approximate null vector in the sense that
%      norm ( A * Z ) = RCOND * norm ( A ) * norm ( Z ).
%

%
%  Compute 1-norm of A.
%
  anorm = 0.0;
  l = ml + 1;
  is = l + mu;

  for j = 1 : n

    anorm = max ( anorm, scasum ( l, abd(is:is+l-1,j), 1 ) );

    if ( ml + 1 < is )
      is = is - 1;
    end

    if ( j <= mu )
      l = l + 1;
    end

    if ( n - ml <= j )
      l = l - 1;
    end

  end
%
%  Factor
%
  [ abd, ipvt, info ] = cgbfa ( abd, lda, n, ml, mu );
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
%  Solve hermitian(U) * W = E.
%
  ek = 1.0;

  z(1:n) = 0.0;

  m = ml + mu + 1;
  ju = 0;

  for k = 1 : n

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( cabs1 ( abd(m,k) ) < cabs1 ( ek - z(k) ) )
      s = cabs1 ( abd(m,k) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end 

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );

    if ( cabs1 ( abd(m,k) ) ~= 0.0 )
      wk = wk / conj ( abd(m,k) );
      wkm = wkm / conj ( abd(m,k) );
    else
      wk = 1.0;
      wkm = 1.0;
    end

    ju = min ( max ( ju, mu + ipvt(k) ), n );
    mm = m;

    if ( k+1 <= ju )

      for j = k+1 : ju
        mm = mm - 1;
        sm = sm + cabs1 ( z(j) + wkm * conj ( abd(mm,j) ) );
        z(j) = z(j) + wk * conj ( abd(mm,j) );
        s = s + cabs1 ( z(j) );
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        mm = m;
        for j = k+1 : ju
          mm = mm - 1;
          z(j) = z(j) + t * conj ( abd(mm,j) );
        end
      end

    end

    z(k) = wk;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
%
%  Solve hermitian(L) * Y = W.
%
  for k = n : -1 : 1

    lm = min ( ml, n - k );

    if ( k < n )
      z(k) = z(k) + z(k+1:k+lm) * conj ( abd(m+1:m+lm,k) );
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

    lm = min ( ml, n - k );

    if ( k < n )
      z(k+1:k+lm) = z(k+1:k+lm) + t * abd(m+1:m+lm,k);
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
%  Solve U * Z = W.
%
  for k = n : -1 : 1

    if ( cabs1 ( abd(m,k) ) < cabs1 ( z(k) ) )
      s = cabs1 ( abd(m,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    if ( cabs1 ( abd(m,k) ) ~= 0.0 )
      z(k) = z(k) / abd(m,k);
    else
      z(k) = 1.0;
    end

    lm = min ( k, m ) - 1;
    la = m - lm;
    lz = k - lm;
    t = -z(k);
    z(lz:lz+lm-1) = z(lz:lz+lm-1) + t * transpose ( abd(la:la+lm-1,k) );

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
