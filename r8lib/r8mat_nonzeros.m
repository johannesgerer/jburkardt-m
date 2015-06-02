function value = r8mat_nonzeros ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NONZEROS counts the nonzeros in an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the matrix.
%
%    Output, integer VALUE, the number of nonzeros.
%
  value = length ( find ( a ) );

  return
end
