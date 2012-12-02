function a = r8mat_diag_set_scalar ( n, a, s )

%*****************************************************************************80
%
%% R8MAT_DIAG_SET_SCALAR sets the diagonal of a matrix to a scalar value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix.
%
%    Input, real A(N,N), the matrix to be modified.
%
%    Input, real S, the value to be assigned to the diagonal
%    of the matrix.
%
%    Output, real A(N,N), the modified matrix.
%
  for i = 1 : n
    a(i,i) = s;
  end

  return
end
