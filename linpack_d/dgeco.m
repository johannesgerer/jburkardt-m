function [ a, ipvt, rcond, z ] = dgeco ( a, lda, n )

%*****************************************************************************80
%
%% DGECO factors a real matrix and estimates its condition number.
%
%  Discussion:
%
%    If RCOND is not needed, DGEFA is slightly faster.
%
%    To solve A * X = B, follow DGECO by DGESL.
%
%    To compute inverse ( A ) * C, follow DGECO by DGESL.
%
%    To compute determinant ( A ), follow DGECO by DGEDI.
%
%    To compute inverse ( A ), follow DGECO by DGEDI.
%
%    For the system A * X = B, relative perturbations in A and B
%    of size EPSILON may cause relative perturbations in X of size
%    EPSILON/RCOND.
%
%    If RCOND is so small that the logical expression
%      1.0D+00 + RCOND == 1.0D+00
%    is true, then A may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate
%    underflows.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2005
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
%    Input, real A(LDA,N), a matrix to be factored.
%
%    Input, integer LDA, the leading dimension of the array A.
%
%    Input, integer N, the order of the matrix A.
%
%    Output, real A(LDA,N), the LU factorization of the matrix.
%
%    Output, integer IPVT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal
%    condition number of A.
%
%    Output, real Z(N), a work vector whose contents are usually
%    unimportant.  If A is close to a singular matrix, then Z is an
%    approximate null vector in the sense that
%      norm ( A * Z ) = RCOND * norm ( A ) * norm ( Z ).
%

%
%  Compute the L1 norm of A.
%
  anorm = 0.0;
  for j = 1 : n
    anorm = max ( anorm, sum ( abs ( a(1:n,j) ) ) );
  end
%
%  Compute the LU factorization.
%
  [ a, ipvt, info ] = dgefa ( a, lda, n );
%
%  RCOND = 1 / ( norm(A) * (estimate of norm(inverse(A))) )
%
%  estimate of norm(inverse(A)) = norm(Z) / norm(Y)
%
%  where
%    A * Z = Y
%  and
%    A' * Y = E
%
%  The components of E are chosen to cause maximum local growth in the
%  elements of W, where U'*W = E.  The vectors are frequently rescaled
%  to avoid overflow.
%
%  Solve U' * W = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  for k = 1 : n

    if ( z(k) ~= 0.0 )
      ek = - abs ( ek ) * r8_sign ( z(k) );
    end

    if ( abs ( a(k,k) ) < abs ( ek - z(k) ) )
      s = abs ( a(k,k) ) / abs ( ek - z(k) );
      z(1:n) = s * z(1:n);
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = abs ( wk );
    sm = abs ( wkm );

    if ( a(k,k) ~= 0.0 )
      wk = wk / a(k,k);
      wkm = wkm / a(k,k);
    else
      wk = 1.0;
      wkm = 1.0;
    end

    if ( k+1 <= n )

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

  z(1:n) = z(1:n) / sum ( abs ( z(1:n) ) );
%
%  Solve L' * Y = W
%
  for k = n : -1 : 1

    z(k) = z(k) + z(k+1:n) * a(k+1:n,k);

    if ( 1.0 < abs ( z(k) ) )
      z(1:n) = z(1:n) / abs ( z(k) );
    end

    l = ipvt(k);

    t = z(l);
    z(l) = z(k);
    z(k) = t;

  end

  z(1:n) = z(1:n) / sum ( abs ( z(1:n) ) );

  ynorm = 1.0;
%
%  Solve L * V = Y.
%
  for k = 1 : n

    l = ipvt(k);

    t = z(l);
    z(l) = z(k);
    z(k) = t;

    z(k+1:n) = z(k+1:n) + t * a(k+1:n,k)';

    if ( 1.0 < abs ( z(k) ) )
      ynorm = ynorm / abs ( z(k) );
      z(1:n) = z(1:n) / abs ( z(k) );
    end

  end

  s = sum ( abs ( z(1:n) ) );
  z(1:n) = z(1:n) / s;
  ynorm = ynorm / s;
%
%  Solve U * Z = V.
%
  for k = n : -1 : 1

    if ( abs ( a(k,k) ) < abs ( z(k) ) )
      s = abs ( a(k,k) ) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    if ( a(k,k) ~= 0.0 )
      z(k) = z(k) / a(k,k);
    else
      z(k) = 1.0;
    end

    z(1:k-1) = z(1:k-1) - z(k) * a(1:k-1,k)';

  end
%
%  Normalize Z in the L1 norm.
%
  s = 1.0 / sum ( abs ( z(1:n) ) );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;

  if ( anorm ~= 0.0 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0;
  end

  return
end
