function a = r8mat_nint ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NINT rounds the entries of an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real A(M,N), the matrix to be rounded.
%
%    Output, real A(M,N), the rounded matrix.
%
  a(1:m,1:n) = round ( a(1:m,1:n) );

  return
end
