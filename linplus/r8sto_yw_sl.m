function x = r8sto_yw_sl ( n, b, x )

%*****************************************************************************80
%
%% R8STO_YW_SL solves the Yule-Walker equations for a R8STO matrix.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
%
%    The matrix is also required to be positive definite.
%
%    This implementation of the algorithm assumes that the diagonal element
%    is 1.
%
%    The real symmetric Toeplitz matrix can be described by N numbers, which,
%    for convenience, we will label B(0:N-1).  We assume there is one more
%    number, B(N).  If we let A be the symmetric Toeplitz matrix whose first
%    row is B(0:N-1), then the Yule-Walker equations are:
%
%      A * X = -B(1:N)
%
%  Example:
%
%    To solve
%
%     1.0 0.5 0.2    x1   0.5
%     0.5 1.0 0.5 *  x2 = 0.2
%     0.2 0.5 1.0    x3   0.1
%
%    we input:
%
%      N = 3
%      B(1:3) = (/ 0.5, 0.2, 0.1 /)
%
%    with output:
%
%      X(1:3) = (/ -75, 12, -5 /) / 140
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub and Charles Van Loan,
%    Section 4.7.2, "Solving the Yule-Walker Equations",
%    Matrix Computations,
%    Third Edition,
%    Johns Hopkins, 1996.
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, real B(N), defines the linear system.  The first entry of A is
%    a 1, followed by B(1) through B(N-1).  The right hand side of the
%    system is -B(1:N).
%
%    Output, real X(N), the solution of the linear system.
%
  x(1) = -b(1);
  beta = 1.0E+00;
  alpha = -b(1);

  for i = 1 : n-1
    beta = ( 1.0E+00 - alpha * alpha ) * beta;
    alpha = - ( b(i+1) + b(i:-1:1) * x(1:i)' ) / beta;
    x(1:i) = x(1:i) + alpha * x(i:-1:1);
    x(i+1) = alpha;
  end

  return
end
