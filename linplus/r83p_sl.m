function x = r83p_sl ( n, a_lu, b, job, work2, work3, work4 )

%*****************************************************************************80
%
%% R83P_SL solves a R83P system.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as
%    a 3 by N array, in which each row corresponds to a diagonal, and
%    column locations are preserved.  The matrix value
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%    The linear system must have been factored by R83P_FA.
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
%    Input, real A_LU(3,N), the LU factors from R83P_FA.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Input, real WORK2(N-1), WORK3(N-1), WORK4, factor data from R83P_FA.
%
%    Output, real X(N), the solution to the linear system.
%
  x(1:n) = b(1:n);

  if ( job == 0 )
%
%  Solve A1 * X1 = B1.
%
    x(1:n-1) = r83_np_sl ( n-1, a_lu, x, job );
%
%  X2 = B2 - A3 * X1
%
    x(n) = x(n) - a_lu(1,1) * x(1) - a_lu(3,n-1) * x(n-1);
%
%  Solve A4 * X2 = X2
%
    x(n) = x(n) / work4;
%
%  X1 := X1 - inverse ( A1 ) * A2 * X2.
%
    x(1:n-1) = x(1:n-1) - work2(1:n-1) * x(n);

  else
%
%  Solve A1' * X1 = B1.
%
    x(1:n-1) = r83_np_sl ( n-1, a_lu, x, job );
%
%  X2 := X2 - A2' * B1
%
    x(n) = x(n) - a_lu(3,n) * x(1) - a_lu(1,n) * x(n-1);
%
%  Solve A4 * X2 = X2.
%
    x(n) = x(n) / work4;
%
%  X1 := X1 - transpose ( inverse ( A1 ) * A3 ) * X2.
%
    x(1:n-1) = x(1:n-1) - work3(1:n-1) * x(n);

  end

  return
end
