function a = r8mat_diag_set_vector ( n, a, v )

%*****************************************************************************80
%
%% R8MAT_DIAG_SET_VECTOR sets the diagonal of a matrix to a vector.
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
%    Input, real V(N), the vector to be assigned to the
%    diagonal of A.
%
%    Output, real A(N,N), the modified matrix.
%
  for i = 1 : n
    a(i,i) = v(i);
  end

  return
end
