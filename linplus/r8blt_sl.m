function x = r8blt_sl ( n, ml, a, b, job )

%*****************************************************************************80
%
%% R8BLT_SL solves a R8BLT system.
%
%  Discussion:
%
%    The R8BLT storage format is appropriate for a banded lower triangular matrix.
%    The matrix is assumed to be zero below the ML-th subdiagonal.
%    The matrix is stored in an ML+1 by N array, in which the diagonal
%    appears in the first row, followed by successive subdiagonals.
%    Columns are preserved.
%
%    No factorization of the lower triangular matrix is required.
%
%  Example:
%
%    N = 5, ML = 2
%
%    A11   0   0   0   0
%    A21 A22   0   0   0
%    A31 A32 A33   0   0
%      0 A42 A43 A44   0
%      0   0 A53 A54 A55
%                --- ---
%                    ---
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the lower bandwidth.
%
%    Input, real A(ML+1,N), the R8BLT matrix.
%
%    Input, real B(N), the right hand side.
%
%    Input, integer JOB, is 0 to solve the untransposed system,
%    nonzero to solve the transposed system.
%
%    Output, real X(N), the solution vector.
%
  x(1:n) = b(1:n);

  if ( job == 0 )

    for j = 1 : n
      x(j) = x(j) / a(1,j);
      ihi = min ( j + ml, n );
      for i = j+1 : ihi
        x(i) = x(i) - a(i-j+1,j) * x(j);
      end
    end

  else

    for j = n : -1 : 1
      x(j) = x(j) / a(1,j);
      ilo = max ( j - ml, 1 );
      for i = ilo : j-1
        x(i) = x(i) - a(j-i+1,i) * x(j);
      end
    end

  end

  return
end
