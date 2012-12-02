function value = r8mat_norm_l2 ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NORM_L2 returns the matrix L2 norm of an R8MAT.
%
%  Discussion:
%
%    The matrix L2 norm is defined as:
%
%      value = sqrt ( max ( 1 <= I <= M ) LAMBDA(I) )
%
%    where LAMBDA contains the eigenvalues of A * A'.
%
%    The matrix L2 norm is derived from the vector L2 norm, and
%    satisifies:
%
%      vec_norm_l2 ( A * x ) <= mat_norm_l2 ( A ) * vec_norm_l2 ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix whose L2 norm is desired.
%
%    Output, real VALUE, the L2 norm of A.
%

%
%  Compute B = A * A'.
%
  b(1:m,1:m) = a(1:m,1:n) * a(1:m,1:n)';
%
%  Diagonalize B.
%
  b = r8mat_symm_jacobi ( m, b );
%
%  Find the maximum eigenvalue, and take its square root.
%
  diag = r8mat_diag_get_vector ( m, b );

  value = sqrt ( max ( diag(1:m) ) );

  return
end
