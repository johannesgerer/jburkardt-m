function c = r8mat_add ( m, n, alpha, a, beta, b )

%*****************************************************************************80
%
%% R8MAT_ADD computes C = alpha * A + beta * B for R8MAT's.
%
%  Discussion:
%
%    An R8MAT is an array of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real ALPHA, the multiplier for A.
%
%    Input, real A(M,N), the first matrix.
%
%    Input, real BETA, the multiplier for A.
%
%    Input, real B(M,N), the second matrix.
%
%    Output, real C(M,N), the sum of alpha*A+beta*B.
%
  c(1:m,1:n) = alpha * a(1:m,1:n) + beta * b(1:m,1:n);

  return
end