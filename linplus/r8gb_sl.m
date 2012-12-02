function x = r8gb_sl ( n, ml, mu, a_lu, pivot, b, job )

%*****************************************************************************80
%
%% R8GB_SL solves a system factored by R8GB_FA.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "R8GB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(2*ML+MU+1,N), the LU factors from R8GB_FA.
%
%    Input, integer PIVOT(N), the pivot vector from R8GB_FA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X(N), the solution.
%
  x(1:n) = b(1:n);

  m = mu + ml + 1;
%
%  Solve A * x = b.
%
  if ( job == 0 )
%
%  Solve L * Y = B.
%
    if ( 1 <= ml )

      for k = 1 : n-1

        lm = min ( ml, n-k );
        l = pivot(k);

        if ( l ~= k )
          t = x(l);
          x(l) = x(k);
          x(k) = t;
        end
        
        for i = 1 : lm
          x(k+i) = x(k+i) + x(k) * a_lu(m+i,k);
        end 
      
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

      for i = 0: lm-1
        x(lb+i) = x(lb+i) - x(k) * a_lu(la+i,k);
      end

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
      for i = 0 : lm - 1
        x(k) = x(k) - a_lu(la+i,k) * x(lb+i);
      end
      x(k) = x(k) / a_lu(m,k);
    end
%
%  Solve L' * X = Y.
%
    if ( 1 <= ml )

      for k = n-1: -1 : 1

        lm = min ( ml, n-k );
        for i = 1 : lm
          x(k) = x(k) + a_lu(m+i,k) * x(k+i);
        end
        l = pivot(k);

        if ( l ~= k )
          t = x(l);
          x(l) = x(k);
          x(k) = t;
        end

      end

    end

  end

  return
end
