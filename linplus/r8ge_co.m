function [ a_lu, pivot, rcond, z ] = r8ge_co ( n, a )

%*****************************************************************************80
%
%% R8GE_CO factors a R8GE matrix and estimates its condition number.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    For the system A * X = B, relative perturbations in A and B
%    of size EPSILON may cause relative perturbations in X of size
%    EPSILON/RCOND.
%
%    If RCOND is so small that the logical expression
%      1.0E+00 + rcond == 1.0E+00
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
%    21 March 2004
%
%  Author:
%
%    Original FORTRAN77 version by Dongarra, Bunch, Moler, Stewart.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%
%    Input, real A(N,N), a matrix to be factored.
%
%    Output, real A_LU(N,N), the LU factorization of the matrix.
%
%    Output, integer PIVOT(N), the pivot indices.
%
%    Output, real RCOND, an estimate of the reciprocal condition number of A.
%
%    Output, real Z(N), a work vector whose contents are usually unimportant.
%    If A is close to a singular matrix, then Z is an approximate null vector
%    in the sense that
%      norm ( A * Z ) = RCOND * norm ( A ) * norm ( Z ).
%

%
%  Compute the L1 norm of A.
%
  anorm = 0.0E+00;
  for j = 1 : n
    anorm = max ( anorm, sum ( abs ( a(1:n,j) ) ) );
  end
%
%  Compute the LU factorization.
%
  [ a, pivot, info ] = r8ge_fa ( n, a );
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
      ek = - r8_sign ( z(k) ) * abs ( ek );
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

    if ( k + 1 <= n )

      for j = k + 1 : n
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

  t = sum ( abs ( z(1:n) ) );
  z(1:n) = z(1:n) / t;
%
%  Solve L' * Y = W
%
  for k = n : -1 : 1

    z(k) = z(k) + a(k+1:n,k)' * z(k+1:n)';

    t = abs ( z(k) );

    if ( 1.0E+00 < t )
      z(1:n) = z(1:n) / t;
    end

    l = pivot(k);

    t = z(l);
    z(l) = z(k);
    z(k) = t;

  end

  z(1:n) = z(1:n) / sum ( abs ( z(1:n) ) );

  ynorm = 1.0E+00;
%
%  Solve L * V = Y.
%
  for k = 1 : n

    l = pivot(k);

    t = z(l);
    z(l) = z(k);
    z(k) = t;

    z(k+1:n) = z(k+1:n) + t * a(k+1:n,k)';

    if ( 1.0E+00 < abs ( z(k) ) )
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

    if ( a(k,k) ~= 0.0E+00 )
      z(k) = z(k) / a(k,k);
    else
      z(k) = 1.0E+00;
    end

    z(1:k-1) = z(1:k-1) - z(k) * a(1:k-1,k)';

  end
%
%  Normalize Z in the L1 norm.
%
  s = 1.0E+00 / sum ( abs ( z(1:n) ) );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;

  if ( anorm ~= 0.0E+00 )
    rcond = ynorm / anorm;
  else
    rcond = 0.0E+00;
  end

  return
end
