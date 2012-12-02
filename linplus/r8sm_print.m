function r8sm_print ( m, n, a, u, v, title )

%*****************************************************************************80
%
%% R8SM_PRINT prints a R8SM matrix.
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
%    07 April 2006
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
%    Input, string TITLE, a title to be printed.
%
  r8sm_print_some ( m, n, a, u, v, 1, 1, m, n, title );

  return
end
