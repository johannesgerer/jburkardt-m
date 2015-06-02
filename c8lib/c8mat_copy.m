function b = c8mat_copy ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_COPY copies a C8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, complex A(M,N), the matrix.
%
%    Output, complex B(M,N), a copy of the matrix.
%
  b(1:m,1:n) = a(1:m,1:n);

  return
end
