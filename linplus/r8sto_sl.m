function x = r8sto_sl ( n, a, b )

%*****************************************************************************80
%
%% R8STO_SL solves a R8STO system.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
%
%    For this routine, the matrix is also required to be positive definite.
%
%    This implementation of the algorithm assumes that the diagonal element
%    is 1.
%
%    The real symmetric Toeplitz matrix can be described by N numbers, which,
%    for convenience, we will label A(0:N-1).
%
%    Note that there is a typographical error in the presentation
%    of this algorithm in the reference, and another in the presentation
%    of a sample problem.  Both involve sign errors.  A minor error
%    makes the algorithm incorrect for the case N = 1.
%
%  Example:
%
%    To solve
%
%     1.0 0.5 0.2    x1    4.0
%     0.5 1.0 0.5 *  x2 = -1.0
%     0.2 0.5 1.0    x3    3.0
%
%    we input:
%
%      N = 3
%      A(0:N-1) = (/ 1.0, 0.5, 0.2 /)
%      B(1:3) = (/ 4.0, -1.0, 3.0 /)
%
%    with output:
%
%      X(1:3) = (/ 355, -376, 285 /) / 56
%             = (/ 6.339, -6.714, 5.089 /)
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
%    Section 4.7.3, "The General Right Hand Side Problem",
%    Matrix Computations,
%    Third Edition,
%    Johns Hopkins, 1996.
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, real A(N), the R8STO matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%
  k = 0;

  beta = 1.0E+00;
  x(k+1) = b(k+1) / beta;

  if ( k < n-1 )
    y(k+1) = -a(k+2) / beta;
  end

  for k = 1 : n-1

    beta = ( 1.0E+00 - y(k) * y(k) ) * beta;

    x(k+1) = ( b(k+1) - a(2:k+1) * x(k:-1:1)' ) / beta;

    x(1:k) = x(1:k) + x(k+1) * y(k:-1:1);

    if ( k < n - 1 )
      y(k+1) = ( -a(k+2) - a(2:k+1) * y(k:-1:1)' ) / beta;
      y(1:k) = y(1:k) + y(k+1) * y(k:-1:1);
    end

  end

  return
end
