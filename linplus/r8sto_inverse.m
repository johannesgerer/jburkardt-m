function b = r8sto_inverse ( n, a )

%*****************************************************************************80
%
%% R8STO_INVERSE computes the inverse of a R8STO matrix.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
%
%    For this routine, the matrix is also required to be positive definite.
%
%    The original implementation of the algorithm assumed that the
%    diagonal element was 1.  The algorithm has been modified so that
%    this is no longer necessary.
%
%    The inverse matrix is NOT guaranteed to be a Toeplitz matrix.  
%    It is guaranteed to be symmetric and persymmetric.
%    The inverse matrix is returned in general storage, that is,
%    as a "R8GE" matrix.
%
%    Thanks, on May 27 2004, to Yunong Zhang of the EEE Department,
%    University of Strathclyde, for pointing out some errors
%    in the original version of this program!
%
%  Example:
%
%    To compute the inverse of
%
%     1.0 0.5 0.2
%     0.5 1.0 0.5
%     0.2 0.5 1.0
%
%    we input:
%
%      N = 3
%      A = (/ 1.0, 0.5, 0.2 /)
%
%    with output:
%
%      B(1:3,1:3) = (/ 75, -40,   5,
%                     -40,  96, -40,
%                       5, -40,  75 /) / 56
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Section 4.7.3, "Computing the Inverse",
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
%    Output, real B(N,N), the inverse of the matrix, in R8GE format.
%
  a2(1:n-1) = a(2:n) / a(1);

  v = r8sto_yw_sl ( n-1, a2 );
%
%  Compute the N-th entry of V.
%
  v(n) = 1.0E+00 / ( 1.0E+00 + a2(1:n-1) * v(1:n-1)' );
%
%  Reverse and scale entries 1 through N-1.
%
  v(1:n-1) = v(n-1:-1:1);

  v(1:n-1) = v(n) * v(1:n-1);
%
%  Set the boundaries of B.
%
  b(1,1:n) = v(n:-1:1);
  b(n,1:n) = v(1:n);
  b(2:n-1,1) = v(n-1:-1:2)';
  b(2:n-1,n) = v(2:n-1)';
%
%  Fill the interior.
%
  for i = 2 : 1+((n-1)/2)
    for j = i : n-i+1
      b(i,j) = b(i-1,j-1) + ( v(n+1-j) * v(n+1-i) - v(i-1) * v(j-1) ) / v(n);
      b(j,i) = b(i,j);
      b(n+1-i,n+1-j) = b(i,j);
      b(n+1-j,n+1-i) = b(i,j);
    end
  end
%
%  Scale B.
%
  b(1:n,1:n) = b(1:n,1:n) / a(1);

  return
end
