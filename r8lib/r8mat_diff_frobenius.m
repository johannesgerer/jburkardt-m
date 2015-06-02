function dif = r8mat_diff_frobenius ( m, n, a, b )

%*****************************************************************************80
%
%% R8MAT_DIFF_FROBENIUS: Frobenius norm of the difference of two R8MAT's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2012
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
%    Input, real A(M,N), B(M,N), the matrices for which we
%    are to compute the Frobenius norm of the difference.
%
%    Output, real DIF, the Frobenius norm of A-B.
%
  dif = sqrt ( sum ( sum ( ( a(1:m,1:n) - b(1:m,1:n) ).^2 ) ) );

  return
end
