function b = r8gb_ml ( n, ml, mu, a_lu, pivot, x, job )

%*****************************************************************************80
%
%% R8GB_ML computes A * x or A' * X, using R8GB_FA factors.
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
%    It is assumed that R8GB_FA has overwritten the original matrix
%    information by LU factors.  R8GB_ML is able to reconstruct the
%    original matrix from the LU factor data.
%
%    R8GB_ML allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
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
%    Input, real A_LU(2*ML+MU+1,N), the LU factors from R8GB_FA.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8GB_FA.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Input, integer JOB, specifies the operation to be done:
%    JOB = 0, compute A * x.
%    JOB nonzero, compute A' * X.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = x(1:n);

  if ( job == 0 )
%
%  Y = U * X.
%
    for j = 1 : n
      ilo = max ( 1, j - ml - mu );
      for i = ilo : j - 1
        b(i) = b(i) + a_lu(i-j+ml+mu+1,j) * b(j);
      end
      b(j) = a_lu(j-j+ml+mu+1,j) * b(j);
    end
%
%  B = PL * Y = PL * U * X = A * x.
%
    for j = n-1 : -1 : 1

      ihi = min ( n, j + ml );
      for i = j+1 : ihi
        b(i) = b(i) - a_lu(i-j+ml+mu+1,j) * b(j);
      end

      k = pivot(j);

      if ( k ~= j )
        temp = b(k);
        b(k) = b(j);
        b(j) = temp;
      end

    end

  else
%
%  Y = ( PL )' * X.
%
    for j = 1 : n-1

      k = pivot(j);

      if ( k ~= j )
        temp = b(k);
        b(k) = b(j);
        b(j) = temp;
      end

      jhi = min ( n, j + ml );
      for i = j+1 : jhi
        b(j) = b(j) - b(i) * a_lu(i-j+ml+mu+1,j);
      end

    end
%
%  B = U' * Y = ( PL * U )' * X = A' * X.
%
    for i = n : -1 : 1

      jhi = min ( n, i + ml + mu );
      for j = i+1 : jhi
        b(j) = b(j) + b(i) * a_lu(i-j+ml+mu+1,j);
      end
      b(i) = b(i) * a_lu(i-i+ml+mu+1,i);
    end

  end

  return
end
