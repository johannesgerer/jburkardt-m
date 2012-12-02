function value = r8mat_norm_li ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NORM_LI returns the matrix L-infinity norm of an R8MAT.
%
%  Discussion:
%
%    The matrix L-infinity norm is defined as:
%
%      value =  max ( 1 <= I <= M ) sum ( 1 <= J <= N ) abs ( A(I,J) ).
%
%    The matrix L-infinity norm is derived from the vector L-infinity norm,
%    and satisifies:
%
%      vec_norm_li ( A * x ) <= mat_norm_li ( A ) * vec_norm_li ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2006
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
%    Input, real A(M,N), the matrix whose L-infinity
%    norm is desired.
%
%    Output, real VALUE, the L-infinity norm of A.
%
  value = 0.0;

  for i = 1 : m
    value = max ( value, sum ( abs ( a(i,1:n) ) ) );
  end

  return
end
