function b = r8sm_to_r8ge ( m, n, a, u, v )

%*****************************************************************************80
%
%% R8SM_TO_R8GE copies a R8SM matrix to a R8GE matrix.
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
%    11 February 2004
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
%    Input, real U(M), V(N), the R8SM vectors.
%
%    Output, real B(M,N), the R8GE matrix.
%
  for i = 1 : m
    b(i,1:n) = a(i,1:n) - u(i) * v(1:n);
  end

  return
end
