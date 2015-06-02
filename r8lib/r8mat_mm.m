function c = r8mat_mm ( n1, n2, n3, a, b )

%*****************************************************************************80
%
%% R8MAT_MM multiplies two R8MAT's.
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
%    Input, integer N1, N2, N3, the order of the matrices.
%
%    Input, real A(N1,N2), B(N2,N3), the matrices to multiply.
%
%    Output, real C(N1,N3), the product matrix C = A * B.
%
  c(1:n1,1:n3) = a(1:n1,1:n2) * b(1:n2,1:n3);

  return
end
