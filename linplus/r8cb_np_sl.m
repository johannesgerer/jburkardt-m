function x = r8cb_np_sl ( n, ml, mu, a_lu, b, job )

%*****************************************************************************80
%
%% R8CB_NP_SL solves a R8CB system factored by R8CB_NP_FA.
%
%  Discussion:
%
%    The R8CB storage format is appropriate for a compact banded matrix.
%    It is assumed that the matrix has lower and upper bandwidths ML and MU,
%    respectively.  The matrix is stored in a way similar to that used
%    by LINPACK and LAPACK for a general banded matrix, except that in
%    this mode, no extra rows are set aside for possible fillin during pivoting.
%    Thus, this storage mode is suitable if you do not intend to factor
%    the matrix, or if you can guarantee that the matrix can be factored
%    without pivoting.
%
%    R8CB_NP_SL can also solve the related system A' * x = b.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(ML+MU+1,N), the compact band matrix, factored by R8CB_NP_FA.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, integer JOB.
%    If JOB is zero, the routine will solve A * x = b.
%    If JOB is nonzero, the routine will solve A' * x = b.
%
%    Output, real X(N), the solution of the linear system.
%
  x(1:n) = b(1:n);
%
%  The value of M is ML + 1, rather than MU + ML + 1.
%
  m = mu + 1;
%
%  Solve A * x = b.
%
  if ( job == 0 )
%
%  Solve PL * Y = B.
%
    if ( 0 < ml )
      for k = 1 : n-1
        lm = min ( ml, n-k );
        x(k+1:k+lm) = x(k+1:k+lm) + x(k) * a_lu(m+1:m+lm,k);
      end
    end
%
%  Solve U * X = Y.
%
    for k = n : -1 : 1
      x(k) = x(k) / a_lu(m,k);
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      x(lb:lb+lm-1) = x(lb:lb+lm-1) - x(k) * a_lu(la:la+lm-1,k)';
    end
%
%  Solve A' * X = B.
%
  else
%
%  Solve U' * Y = B.
%
    for k = 1 : n
      lm = min ( k, m ) - 1;
      la = m - lm;
      lb = k - lm;
      x(k) = ( x(k) - a_lu(la:la+lm-1,k)' * x(lb:lb+lm-1)' ) / a_lu(m,k);
    end
%
%  Solve ( PL )' * X = Y.
%
    if ( 0 < ml )

      for k = n-1 : -1 : 1
        lm = min ( ml, n-k );
        x(k) = x(k) + a_lu(m+1:m+lm,k)' * x(k+1:k+lm)';
      end

    end

  end

  return
end
