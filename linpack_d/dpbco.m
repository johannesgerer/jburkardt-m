function [ abd, rcond, z, info ] = dpbco ( abd, lda, n, m )

%*****************************************************************************80
%
%% DPBCO factors a real symmetric positive definite banded matrix.
%
%  Discussion:
%
%    DPBCO also estimates the condition of the matrix.
%
%    If RCOND is not needed, DPBFA is slightly faster.
%
%    To solve A*X = B, follow DPBCO by DPBSL.
%
%    To compute inverse(A)*C, follow DPBCO by DPBSL.
%
%    To compute determinant(A), follow DPBCO by DPBDI.
%
%  Band storage:
%
%    If A is a symmetric positive definite band matrix, the following 
%    program segment will set up the input.
%
%      m = (band width above diagonal)
%      do j = 1, n
%        i1 = max (1, j-m)
%        do i = i1, j
%          k = i-j+m+1
%          abd(k,j) = a(i,j)
%        end do
%      end do
%
%    This uses M + 1 rows of A, except for the M by M upper left triangle, 
%    which is ignored.
%
%    For example, if the original matrix is
%
%      11 12 13  0  0  0
%      12 22 23 24  0  0
%      13 23 33 34 35  0
%       0 24 34 44 45 46
%       0  0 35 45 55 56
%       0  0  0 46 56 66
%
%    then N = 6, M = 2  and ABD should contain
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
%    Input, real ABD(LDA,N), the matrix to be factored.  The columns of the 
%    upper triangle are stored in the columns of ABD and the diagonals of 
%    the upper triangle are stored in the rows of ABD.  
%
%    Input, integer LDA, the leading dimension of the array ABD.
%    M+1 <= LDA is required.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Output, real ABD(LDA,N), an upper triangular matrix R, stored in band form,
%    so that A = R'*R.  If INFO /= 0, the factorization is not complete.
%
%    Output, real RCOND, an estimate of the reciprocal condition
%    of A.  For the system A*X = B, relative perturbations in A and B of size  
%    EPSILON may cause relative perturbations in X of size EPSILON/RCOND.
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
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
%    K, signals an error condition.  The leading minor of order K is not 
%    positive definite.
%

%
%  Find the norm of A.
%
  for j = 1 : n

    l = min ( j, m+1 );
    mu = max ( m+2-j, 1 );
    z(j) = dasum ( l, abd(mu:mu+l-1,j), 1 );
    k = j - l;
    for i = mu : m
      k = k + 1;
      z(k) = z(k) + abs ( abd(i,j) );
    end

  end

  anorm = max ( z(1:n) );
%
%  Factor.
%
  [ abd, info ] = dpbfa ( abd, lda, n, m );

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

    if ( abd(m+1,k) < abs ( ek - z(k) ) )
      s = abd(m+1,k) / abs ( ek - z(k) );
      z(1:n) = s * z(1:n);
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = abs ( wk );
    sm = abs ( wkm );
    wk = wk / abd(m+1,k);
    wkm = wkm / abd(m+1,k);
    j2 = min ( k+m, n );
    i = m + 1;

    if ( k+1 <= j2 )

      for j = k+1 : j2
        i = i - 1;
        sm = sm + abs ( z(j) + wkm * abd(i,j) );
        z(j) = z(j) + wk * abd(i,j);
        s = s + abs ( z(j) );
      end

      if ( s < sm )

        t = wkm - wk;
        wk = wkm;
        i = m + 1;

        for j = k+1 : j2
          i = i - 1;
          z(j) = z(j) + t * abd(i,j);
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

    if ( abd(m+1,k) < abs ( z(k) ) )
      s = abd(m+1,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
    end

    z(k) = z(k) / abd(m+1,k);
    lm = min ( k-1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = -z(k);
    z(lb:lb+lm-1) = z(lb:lb+lm-1) + t * abd(la:la+lm-1,k)';

  end

  z(1:n) = z(1:n) / dasum ( n, z(1:n), 1 );

  ynorm = 1.0;
%
%  Solve R' * V = Y.
%
  for k = 1 : n

    lm = min ( k-1, m );
    la = m + 1 - lm;
    lb = k - lm;

    z(k) = z(k) - ddot ( lm, abd(la:la+lm-1,k), 1, z(lb:lb+lm-1), 1 );

    if ( abd(m+1,k) < abs ( z(k) ) )
      s = abd(m+1,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / abd(m+1,k);

  end

  s = 1.0 / dasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;
%
%  Solve R * Z = W.
%
  for k = n : -1 : 1

    if ( abd(m+1,k) < abs ( z(k) ) )
      s = abd(m+1,k) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    z(k) = z(k) / abd(m+1,k);
    lm = min ( k-1, m );
    la = m + 1 - lm;
    lb = k - lm;
    t = -z(k);
    z(lb:lb+lm-1) = z(lb:lb+lm-1) + t * abd(la:la+lm-1,k)';

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
