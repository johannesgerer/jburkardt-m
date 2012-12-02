function b = r83_np_ml ( n, a_lu, x, job )

%*****************************************************************************80
%
%% R83_NP_ML computes A * x or x * A, where A has been factored by R83_NP_FA.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 2.
%
%    Input, real A_LU(3,N), the LU factors from R83_FA.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Input, integer JOB, specifies the product to find.
%    0, compute A * x.
%    nonzero, compute A' * x.
%
%    Output, real B(N), the product A*x or A'*x.
%
  b(1:n) = x(1:n);

  if ( job == 0 )
%
%  Compute X := U * X
%
    for i = 1 : n

      b(i) = a_lu(2,i) * b(i);

      if ( i < n )
        b(i) = b(i) + a_lu(1,i+1) * b(i+1);
      end

    end
%
%  Compute X: = L * X.
%
    for i = n : -1 : 2
      b(i) = b(i) + a_lu(3,i-1) * b(i-1);
    end

  else
%
%  Compute X: = L' * X.
%
    for i = 1 : n-1
      b(i) = b(i) + a_lu(3,i) * b(i+1);
    end
%
%  Compute X: = U' * X.
%
    for i = n : -1 : 2
      b(i) = a_lu(2,i) * b(i);
      b(i) = b(i) + a_lu(1,i) * b(i-1);
    end
    b(1) = a_lu(2,1) * b(1);

  end

  return
end

