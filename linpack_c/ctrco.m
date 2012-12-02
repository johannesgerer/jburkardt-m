function rcond = ctrco ( t, ldt, n, job )

%*****************************************************************************80
%
%% CTRCO estimates the condition of a complex triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2007
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
%    Input, complex T(LDT,N), the triangular matrix.  The zero
%    elements of the matrix are not referenced, and the corresponding 
%    elements of the array can be used to store other information.
%
%    Input, integer LDT, the leading dimension of T.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB, indicates if matrix is upper or lower triangular.
%    0, lower triangular.
%    nonzero, upper triangular.
%
%    Output, real RCOND, an estimate of the reciprocal condition of T.
%    For the system T*X = B, relative perturbations in T and B of size 
%    EPSILON may cause relative perturbations in X of size (EPSILON/RCOND).
%    If RCOND is so small that the logical expression
%      1.0 + RCOND == 1.0
%    is true, then T may be singular to working precision.  In particular, 
%    RCOND is zero if exact singularity is detected or the estimate
%    underflows.
%
%  Local Parameters:
%
%    Workspace, complex Z(N), a work vector whose contents are usually
%    unimportant.  If T is close to a singular matrix, then Z is
%    an approximate null vector in the sense that
%      norm(A*Z) = RCOND * norm(A) * norm(Z).
%
  lower = ( job == 0 );
%
%  Compute 1-norm of T.
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
 
    tnorm = max ( tnorm, scasum ( l, t(i1:i1+l-1,j), 1 ) );

  end
%
%  RCOND = 1/(norm(T)*(estimate of norm(inverse(T)))).
%
%  Estimate = norm(Z)/norm(Y) where T*Z = Y and hermitian(T)*Y = E.
%
%  Hermitian(T) is the conjugate transpose of T.
%
%  The components of E are chosen to cause maximum local
%  growth in the elements of Y.
%
%  The vectors are frequently rescaled to avoid overflow.
%
%  Solve hermitian(T)*Y = E.
%
  ek = 1.0;
  z(1:n) = 0.0;

  for kk = 1 : n

    if ( lower )
      k = n + 1 - kk;
    else
      k = kk;
    end

    if ( cabs1 ( z(k) ) ~= 0.0 )
      ek = csign1 ( ek, -z(k) );
    end

    if ( cabs1 ( t(k,k) ) < cabs1 ( ek - z(k) ) )
      s = cabs1 ( t(k,k) ) / cabs1 ( ek - z(k) );
      z(1:n) = z(1:n) * s;
      ek = s * ek;
    end

    wk = ek - z(k);
    wkm = - ek - z(k);
    s = cabs1 ( wk );
    sm = cabs1 ( wkm );

    if ( cabs1 ( t(k,k) ) ~= 0.0 )
      wk = wk / conj ( t(k,k) );
      wkm = wkm / conj ( t(k,k) );
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
        sm = sm + cabs1 ( z(j) + wkm * conj ( t(k,j) ) );
        z(j) = z(j) + wk * conj ( t(k,j) );
        s = s + cabs1 ( z(j) );
      end

      if ( s < sm )
        w = wkm - wk;
        wk = wkm;
        z(j1:j2) = z(j1:j2) + w * conj ( t(k,j1:j2) );
      end

    end

    z(k) = wk;

  end

  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = 1.0;
%
%  Solve T*Z = Y.
%
  for kk = 1 : n

    if ( lower )
      k = kk;
    else
      k = n + 1 - kk;
    end

    if ( cabs1 ( t(k,k) ) < cabs1 ( z(k) ) )
      s = cabs1 ( t(k,k) ) / cabs1 ( z(k) );
      z(1:n) = z(1:n) * s;
      ynorm = s * ynorm;
    end

    if ( cabs1 ( t(k,k) ) ~= 0.0 )
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
      z(i1:i1+n-kk-1) = z(i1:i1+n-kk-1) + w * transpose ( t(i1:i1+n-kk-1,k) );
    end

  end
%
%  Make ZNORM = 1.
%
  s = 1.0 / scasum ( n, z, 1 );
  z(1:n) = z(1:n) * s;
  ynorm = s * ynorm;

  if ( tnorm ~= 0.0 )
    rcond = ynorm / tnorm;
  else
    rcond = 0.0;
  end

  return
end
