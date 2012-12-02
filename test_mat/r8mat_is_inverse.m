function error_frobenius = r8mat_is_inverse ( n, a, b )

%*****************************************************************************80
%
%% R8MAT_IS_INVERSE determines if one matrix is the inverse of another.
%
%  Discussion:
%
%    This routine returns the sum of the Frobenius norms of
%    A * B - I and B * A - I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns 
%    of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real B(N,N), the matrix to be checked as an inverse of A.
%
%    Output, real ERROR_FROBENIUS, the sum of the Frobenius norms
%    of the difference matrices A * B - I and B * A - I, which would be exactly zero
%    if B was the exact inverse of A and computer arithmetic were exact.
%
  error_left = r8mat_is_inverse_left ( n, n, a, b );
  error_right = r8mat_is_inverse_right ( n, n, a, b );

  error_frobenius = error_left + error_right;

  return
end

