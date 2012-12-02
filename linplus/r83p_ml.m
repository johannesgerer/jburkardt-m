function b = r83p_ml ( n, a_lu, x, job )

%*****************************************************************************80
%
%% R83P_ML computes A * x or x * A, where A has been factored by R83P_FA.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as 
%    a 3 by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  The matrix value 
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 3.
%
%    Input, real A_LU(3,N), the factors computed by R83P_FA.
%
%    Input, real X(N), the vector to be multiplied by the matrix.
%
%    Input, integer JOB, indicates what product should be computed.
%    0, compute A * x.
%    nonzero, compute A' * x.
%
%    Output, real B(N), the result of the multiplication.
%

%
%  Multiply A(1:N-1,1:N-1) and X(1:N-1).
%
  b(1:n-1) = r83_np_ml ( n-1, a_lu(1:3,1:n-1), x, job );
%
%  Add terms from the border.
%
  if ( job == 0 )
    b(1) = b(1) + a_lu(3,n) * x(n);
    b(n-1) = b(n-1) + a_lu(1,n) * x(n);
    b(n) = a_lu(1,1) * x(1) + a_lu(3,n-1) * x(n-1) + a_lu(2,n) * x(n);
  else
    b(1) = b(1) + a_lu(1,1) * x(n);
    b(n-1) = b(n-1) + a_lu(3,n-1) * x(n);
    b(n) = a_lu(3,n) * x(1) + a_lu(1,n) * x(n-1) + a_lu(2,n) * x(n);
  end

  return
end
