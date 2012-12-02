function b = r8cb_ml ( n, ml, mu, a_lu, x, job )

%*****************************************************************************80
%
%% R8CB_ML computes A * x or A' * X, using R8CB_NP_FA factors.
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
%    It is assumed that R8CB_NP_FA has overwritten the original matrix
%    information by LU factors.  R8CB_ML is able to reconstruct the
%    original matrix from the LU factor data.
%
%    R8CB_ML allows the user to check that the solution of a linear
%    system is correct, without having to save an unfactored copy
%    of the matrix.
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
%    Input, real X(N), the vector to be multiplied.
%
%    Input, integer JOB, specifies the operation to be done:
%    JOB = 0, compute A * x.
%    JOB nonzero, compute A' * x.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = x(1:n);

  if ( job == 0 )
%
%  Y = U * X.
%
    for j = 1 : n
      ilo = max ( 1, j - mu );
      for i = ilo : j - 1
        b(i) = b(i) + a_lu(i-j+mu+1,j) * b(j);
      end
      b(j) = a_lu(j-j+mu+1,j) * b(j);
    end
%
%  B = PL * Y = PL * U * X = A * x.
%
    for j = n-1 : -1 : 1
      ihi = min ( n, j + ml );
      b(j+1:ihi) = b(j+1:ihi) - a_lu(mu+2:ihi-j+mu+1,j) * b(j);
    end

  else
%
%  Y = ( PL )' * X.
%
    for j = 1 : n-1

      ihi = min ( n, j + ml );
      for i = j+1 : ihi
        b(j) = b(j) - b(i) * a_lu(i-j+mu+1,j);
      end

    end
%
%  B = U' * Y = ( PL * U )' * X = A' * X.
%
    for i = n : -1 : 1
      jhi = min ( n, i + mu );
      for j = i+1 : jhi
        b(j) = b(j) + b(i) * a_lu(i-j+mu+1,j);
      end
      b(i) = b(i) * a_lu(i-i+mu+1,i);
    end

  end

  return
end
