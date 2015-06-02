function c = r8mat_sub ( m, n, a, b )

%*****************************************************************************80
%
%% R8MAT_SUB computes the difference of two matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrices.
%
%    Input, real A(M,N), B(M,N), the matrices.
%
%    Output, real C(M,N), the result A - B.
%
  c = a - b;

  return
end
