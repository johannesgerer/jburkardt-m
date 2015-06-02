function c = c8mat_add ( m, n, alpha, a, beta, b )

%*****************************************************************************80
%
%% C8MAT_ADD combines two C8MAT's with scalar factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, complex ALPHA, the first scale factor.
%
%    Input, complex A(M,N), the first matrix.
%
%    Input, complex BETA, the second scale factor.
%
%    Input, complex B(M,N), the second matrix.
%
%    Output, complex C(M,N), the result.
%
  c(1:m,1:n) = alpha * a(1:m,1:n) + beta * b(1:m,1:n);

  return
end
