function c = r8mat_mtm ( n1, n2, n3, a, b )

%*****************************************************************************80
%
%% R8MAT_MTM computes the matrix product C = A' * B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%
%    Input, real A(N2,N1), B(N2,N3), the matrices to multiply.
%
%    Output, real C(N1,N3), the product matrix C = A' * B.
%
  c(1:n1,1:n3) = a(1:n2,1:n1)' * b(1:n2,1:n3);

  return
end
