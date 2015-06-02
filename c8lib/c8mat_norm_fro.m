function value = c8mat_norm_fro ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_NORM_FRO returns the Frobenius norm of a C8MAT.
%
%  Discussion:
%
%    The Frobenius norm is defined as
%
%      C8MAT_NORM_FRO = sqrt (
%        sum ( 1 <= I <= M ) sum ( 1 <= j <= N ) A(I,J) * A(I,J) )
%
%    The matrix Frobenius norm is not derived from a vector norm, but
%    is compatible with the vector L2 norm, so that:
%
%      c8vec_norm_l2 ( A * x ) <= c8mat_norm_fro ( A ) * c8vec_norm_l2 ( x ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2015
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
%    Input, complex A(M,N), the matrix whose norm is desired.
%
%    Output, real VALUE, the norm of A.
%
  value = ...
    sqrt ...
    ( ...
      sum ...
      ( ...
        sum ...
        ( ...
          ( ...
            abs ...
            ( ...
              a(1:m,1:n) ...
            ) ...
          ) .^ 2 ...
        ) ...
      ) ...
   );

  return
end
