function value = r8mat_norm_fro_affine ( m, n, a1, a2 )

%*****************************************************************************80
%
%% R8MAT_NORM_FRO_AFFINE returns the Frobenius norm of an R8MAT difference.
%
%  Discussion:
%
%    The Frobenius norm is defined as
%
%      value = sqrt ( sum ( 1 <= I <= M ) sum ( 1 <= j <= N ) A(I,J)^2 )
%
%    The matrix Frobenius norm is not derived from a vector norm, but
%    is compatible with the vector L2 norm, so that:
%
%      vec_norm_l2 ( A * x ) <= mat_norm_fro ( A ) * vec_norm_l2 ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, real A1(M,N), A2(M,N), the matrices for whose difference 
%    the Frobenius norm is desired.
%
%    Output, real VALUE, the Frobenius norm of A1 - A2.
%
  value = sqrt ( sum ( sum ( ( a1(1:m,1:n) - a2(1:m,1:n) ).^2 ) ) );

  return
end
