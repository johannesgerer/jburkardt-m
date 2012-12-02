function [ x, info ] = r8gb_trs ( n, ml, mu, nrhs, trans, a_lu, pivot, b )

%*****************************************************************************80
%
%% R8GB_TRS solves a linear system factored by R8GB_TRF.
%
%  Discussion:
%
%    The R8GB storage format is for an M by N banded matrix, with lower 
%    bandwidth ML and upper bandwidth MU.  Storage includes room for ML 
%    extra superdiagonals, which may be required to store nonzero entries 
%    generated during Gaussian elimination.
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
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix A.
%    N must be positive.
%
%    Input, integer ML, the number of subdiagonals within the band of A.
%    ML must be at least 0, and no greater than N - 1.
%
%    Input, integer MU, the number of superdiagonals within the band of A.
%    MU must be at least 0, and no greater than N - 1.
%
%    Input, integer NRHS, the number of right hand sides and the number of
%    columns of the matrix B.  NRHS must be positive.
%
%    Input, character TRANS, specifies the form of the system.
%    'N':  A * x = b  (No transpose)
%    'T':  A'* X = B  (Transpose)
%    'C':  A'* X = B  (Conjugate transpose = Transpose)
%
%    Input, real A_LU(2*ML+MU+1,N), the LU factors from R8GB_TRF.  
%
%    Input, integer PIVOT(N), the pivot indices; for 1 <= I <= N, row I
%    of the matrix was interchanged with row PIVOT(I).
%
%    Input, real B(N,NRHS), the right hand side vectors.
%
%    Output, real X(N,NRHS), the solution vectors, X.
%
%    Output, integer INFO, error flag.
%    = 0:  successful exit
%    < 0: if INFO = -K, the K-th argument had an illegal value
%

%
%  Test the input parameters.
%
  info = 0;

  if ( trans ~= 'N' & trans ~= 'n' & trans ~= 'T' & trans ~= 't' & ...
       trans ~= 'C' & trans ~= 'c' )
    info = -1;
    return
  elseif ( n <= 0 )
    info = -2;
    return
  elseif ( ml < 0 )
    info = -3;
    return
  elseif ( mu < 0 )
    info = -4;
    return
  elseif ( nrhs <= 0 )
    info = -5;
    return
  end

  kd = mu + ml + 1;
  x(1:n,1:nrhs) = b(1:n,1:nrhs);
%
%  Solve A * x = b.
%
%  Solve L * x = b, overwriting b with x.
%
%  L is represented as a product of permutations and unit lower
%  triangular matrices L = P(1) * L(1) * ... * P(n-1) * L(n-1),
%  where each transformation L(i) is a rank-one modification of
%  the identity matrix.
%
  if ( trans == 'N' | trans == 'n' )

    if ( 0 < ml )

      for j = 1 : n - 1

        lm = min ( ml, n-j );
        l = pivot(j);

        for i = 1 : nrhs
          t = x(l,i);
          x(l,i) = x(j,i);
          x(j,i) = t;
        end

        for k = 1 : nrhs
          if ( x(j,k) ~= 0.0 )
            x(j+1:j+lm,k) = x(j+1:j+lm,k) - a_lu(kd+1:kd+lm,j) * x(j,k);
          end
        end

      end

    end
%
%  Solve U * x = b, overwriting b with x.
%
    for i = 1 : nrhs

      for j = n : -1 : 1
        if ( x(j,i) ~= 0.0E+00 )
          l = ml + mu + 1 - j;
          x(j,i) = x(j,i) / a_lu(ml+mu+1,j);
          for k = j - 1 : -1 : max ( 1, j - ml - mu )
            x(k,i) = x(k,i) - a_lu(l+k,j) * x(j,i);
          end
        end
      end

    end

  else
%
%  Solve A' * x = b.
%
%  Solve U' * x = b, overwriting b with x.
%
    for i = 1 : nrhs

      for j = 1 : n
        temp = x(j,i);
        l = ml + mu + 1 - j;
        for k = max ( 1, j - ml - mu ) : j - 1
          temp = temp - a_lu(l+k,j) * x(k,i);
        end
        x(j,i) = temp / a_lu(ml+mu+1,j);
      end

    end
%
%  Solve L' * x = b, overwriting b with x.
%
    if ( 0 < ml )

      for j = n - 1 : -1 : 1

        lm = min ( ml, n-j );

        for k = 1 : nrhs
          x(j,k) = x(j,k) - x(j+1:j+lm,k)' * a_lu(kd+1:kd+lm,j);
        end

        l = pivot(j);

        for i = 1 : nrhs
          t = x(l,i);
          x(l,i) = x(j,i);
          x(j,i) = t;
        end
        
      end
    end
  end

  return
end
