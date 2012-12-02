function [ rcond, z ] = strco ( t, ldt, n, job )

%*****************************************************************************80
%
%% STRCO estimates the condition of a real triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
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
%    Input, real T(LDT,N), the triangular matrix.  The zero
%    elements of the matrix are not referenced, and the corresponding
%    elements of the array can be used to store other information.
%
%    Input, integer LDT, the leading dimension of the array T.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real RCOND, an estimate of the reciprocal condition
%    of T.  For the system T*X = B, relative perturbations in T and B of size
%    EPSILON may cause relative perturbations in X of size EPSILON/RCOND.
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0D+00
%    is true, then T may be singular to working precision.  In particular,
%    RCOND is zero if exact singularity is detected or the estimate underflows.
%
%    Output, real Z(N) a work vector whose contents are usually
%    unimportant.  If T is close to a singular matrix, then Z is an
%    approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%
%    Input, integer JOB, indicates the shape of T:
%    0, T is lower triangular.
%    nonzero, T is upper triangular.
%
  lower = ( job == 0 );
%
%  Compute the 1-norm of T.
%
  tnorm = 0.0;

  for j = 1 : n

    if ( lower )
      l = n + 1 - j;
      i1 = j;
    else
      l = j;
      i1 = 1;
    end

    tnorm = max ( tnorm, sasum ( l, t(i1:i1+l-1,j), 1 ) );

  end
%
%  RCOND = 1/(norm(T)*(estimate of norm(inverse(T)))).
%
%  Estimate = norm(Z)/norm(Y) where T * Z = Y and T' * Y = E.
%
%  T' is the transpose of T.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of Y.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve T' * Y = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  for kk = 1 : n

    if ( lower )
      k = n + 1 - kk;
    else
      k = kk;
    end

    if ( z(k) ~= 0.0 )
      ek = - abs ( ek ) * r4_sign ( z(k) );
    end

    if ( abs ( t(k,k) ) < abs ( ek - z(k) ) )
      s = abs ( t(k,k) ) / abs ( ek - z(k) );
      z(1:n) = s * z(1:n);
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = -ek - z(k);
    s = abs ( wk );
    sm = abs ( wkm );

    if ( t(k,k) ~= 0.0 )
      wk = wk / t(k,k);
      wkm = wkm / t(k,k);
    else
      wk = 1.0;
      wkm = 1.0;
    end

    if ( kk ~= n )

      if ( lower )
        j1 = 1;
        j2 = k - 1;
      else
        j1 = k + 1;
        j2 = n;
      end

      for j = j1 : j2
        sm = sm + abs ( z(j) + wkm * t(k,j) );
        z(j) = z(j) + wk * t(k,j);
        s = s + abs ( z(j) );
      end

      if ( s < sm )
        w = wkm - wk;
        wk = wkm;
        for j = j1 : j2
          z(j) = z(j) + w * t(k,j);
        end
      end

    end

    z(k) = wk;

  end

  z(1:n) = z(1:n) / sasum ( n, z(1:n), 1 );

  ynorm = 1.0;
%
%  Solve T * Z = Y.
%
  for kk = 1 : n

    if ( lower )
      k = kk;
    else
      k = n + 1 - kk;
    end

    if ( abs ( t(k,k) ) < abs ( z(k) ) )
      s = abs ( t(k,k) ) / abs ( z(k) );
      z(1:n) = s * z(1:n);
      ynorm = s * ynorm;
    end

    if ( t(k,k) ~= 0.0 )
      z(k) = z(k) / t(k,k);
    else
      z(k) = 1.0;
    end

    if ( lower )
      i1 = k + 1;
    else
      i1 = 1;
    end

    if ( kk < n )
      w = -z(k);
      z(i1:i1+n-kk-1) = ...
        saxpy ( n-kk, w, t(i1:i1+n-kk-1,k)', 1, z(i1:i1+n-kk-1), 1 );
    end

  end
%
%  Make ZNORM = 1.0.
%
  s = 1.0 / sasum ( n, z(1:n), 1 );
  z(1:n) = s * z(1:n);
  ynorm = s * ynorm;

  if ( tnorm ~= 0.0 )
    rcond = ynorm / tnorm;
  else
    rcond = 0.0;
  end

  return
end
