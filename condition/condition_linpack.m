function cond = condition_linpack ( n, a )

%*****************************************************************************80
%
%% CONDITION_LINPACK estimates the L1 condition number of a matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    For the system A * X = B, relative perturbations in A and B
%    of size EPSILON may cause relative perturbations in X of size
%    EPSILON*RCOND.
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
%    Output, real COND, an estimate of the condition number of A.
%

%
%  Compute the L1 norm of A.
%
  anorm = norm ( a, 1 );
%
%  Compute the LU factorization.
%
  [ a_lu, pivot, info ] = r8ge_fa ( n, a );
%
%  COND = norm(A) * (estimate of norm(inverse(A))) 
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
  z(1:n,1) = 0.0;

  for k = 1 : n

    if ( z(k,1) ~= 0.0 )
      ek = - r8_sign ( z(k,1) ) * abs ( ek );
    end

    if ( abs ( a_lu(k,k) ) < abs ( ek - z(k,1) ) )
      s = abs ( a_lu(k,k) ) / abs ( ek - z(k,1) );
      z(1:n,1) = s * z(1:n,1);
      ek = s * ek;
    end

    wk = ek - z(k,1);
    wkm = -ek - z(k,1);
    s = abs ( wk );
    sm = abs ( wkm );

    if ( a_lu(k,k) ~= 0.0 )
      wk = wk / a_lu(k,k);
      wkm = wkm / a_lu(k,k);
    else
      wk = 1.0;
      wkm = 1.0;
    end

    if ( k + 1 <= n )

      for j = k + 1 : n
        sm = sm + abs ( z(j,1) + wkm * a_lu(k,j) );
        z(j,1) = z(j,1) + wk * a_lu(k,j);
        s = s + abs ( z(j,1) );
      end

      if ( s < sm )
        t = wkm - wk;
        wk = wkm;
        z(k+1:n,1) = z(k+1:n,1) + t * a_lu(k,k+1:n)';
      end

    end

    z(k,1) = wk;

  end

  t = sum ( abs ( z(1:n,1) ) );
  z(1:n,1) = z(1:n,1) / t;
%
%  Solve L' * Y = W
%
  for k = n : -1 : 1

    z(k,1) = z(k,1) + a_lu(k+1:n,k)' * z(k+1:n,1);

    t = abs ( z(k,1) );

    if ( 1.0 < t )
      z(1:n,1) = z(1:n,1) / t;
    end

    l = pivot(k);

    t = z(l,1);
    z(l,1) = z(k,1);
    z(k,1) = t;

  end

  z(1:n,1) = z(1:n,1) / sum ( abs ( z(1:n,1) ) );

  ynorm = 1.0;
%
%  Solve L * V = Y.
%
  for k = 1 : n

    l = pivot(k);

    t = z(l,1);
    z(l,1) = z(k,1);
    z(k,1) = t;

    z(k+1:n,1) = z(k+1:n,1) + t * a_lu(k+1:n,k);

    if ( 1.0 < abs ( z(k,1) ) )
      ynorm = ynorm / abs ( z(k,1) );
      z(1:n) = z(1:n) / abs ( z(k,1) );
    end

  end

  s = sum ( abs ( z(1:n,1) ) );
  z(1:n,1) = z(1:n,1) / s;
  ynorm = ynorm / s;
%
%  Solve U * Z = V.
%
  for k = n : -1 : 1

    if ( abs ( a_lu(k,k) ) < abs ( z(k,1) ) )
      s = abs ( a_lu(k,k) ) / abs ( z(k,1) );
      z(1:n,1) = s * z(1:n,1);
      ynorm = s * ynorm;
    end

    if ( a_lu(k,k) ~= 0.0 )
      z(k,1) = z(k,1) / a_lu(k,k);
    else
      z(k,1) = 1.0;
    end

    z(1:k-1,1) = z(1:k-1,1) - a_lu(1:k-1,k) * z(k,1);

  end
%
%  Normalize Z in the L1 norm.
%
  s = 1.0 / sum ( abs ( z(1:n,1) ) );
  z(1:n,1) = s * z(1:n,1);
  ynorm = s * ynorm;

  cond = anorm / ynorm;

  return
end
