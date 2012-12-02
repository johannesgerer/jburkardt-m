function b = r8sm_mxv ( m, n, a, u, v, x )

%*****************************************************************************80
%
%% R8SM_MXV multiplies a R8SM matrix times a vector.
%
%  Discussion:
%
%    The R8SM storage format is used for an M by N Sherman Morrison matrix B,
%    which is defined by an M by N matrix A, an M vector U, and
%    an N vector V, by B = A - U * V'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), the R8SM matrix.
%
%    Input, real U(M), V(N), the R8SM vectors U and V.
%
%    Input, real X(N), the vector to be multiplied by (A-u*v').
%
%    Output, real B(M), the product (A-u*v') * x.
%
  b(1:m) = a(1:m,1:n) * x(1:n)' - u(1:m)' * ( v(1:n) * x(1:n)' );

  return
end
