function v = r8mat_diag_get_vector ( n, a )
%*****************************************************************************80
%
%% R8MAT_DIAG_GET_VECTOR gets the value of the diagonal of an R8MAT.
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
%    Input, real A(N,N), the matrix.
%
%    Output, real V(N), the diagonal entries of the matrix.
%
  for i = 1 : n
    v(i) = a(i,i);
  end

  return
end
