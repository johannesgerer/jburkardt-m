function error_frobenius = r8mat_is_inverse_left ( m, n, a, b )

%*****************************************************************************80
%
%% R8MAT_IS_INVERSE_LEFT determines if one matrix is the left inverse of another.
%
%  Discussion:
%
%    This routine returns the Frobenius norm of B * A - I.
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
%    Input, integer M, N, the number of rows and columns 
%    of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, real B(N,M), the matrix to be checked as a left inverse of A.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix B * A - I, which would be exactly zero
%    if B was the exact left inverse of A and computer arithmetic were exact.
%
  c(1:n,1:n) = b(1:n,1:m) * a(1:m,1:n);

  for i = 1 : n
    c(i,i) = c(i,i) - 1.0;
  end

  error_frobenius = r8mat_norm_fro ( n, n, c );

  return
end

