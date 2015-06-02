function norm = r8mat_norm_eis ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_NORM_EIS returns the EISPACK norm of an R8MAT.
%
%  Discussion:
%
%    The EISPACK norm is defined as:
%
%      value = sum ( 1 <= I <= M ) sum ( 1 <= J <= N ) abs ( A(I,J) )
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
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix whose EISPACK norm is desired.
%
%    Output, real NORM, the EISPACK norm of A.
%
  norm = sum ( sum ( abs ( a(1:m,1:n) ) ) );

  return
end
