function a = c8mat_zero ( m, n )

%*****************************************************************************80
%
%% C8MAT_ZERO sets a matrix A to zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, complex A(M,N), the result.
%
  a(1:m,1:n) = 0.0;

  return
end
