function error_frobenius = c8mat_is_inverse ( n, a, b )

%*****************************************************************************80
%
%% C8MAT_IS_INVERSE determines if one matrix is the inverse of another.
%
%  Discussion:
%
%    Actually, this routine simply returns the Frobenius norm of
%    A * B - I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
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
%    Input, complex A(N,N), B(N,N), the matrices.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A * B - I, which would be exactly zero
%    if B was the exact inverse of A and computer arithmetic were exact.
%
  c(1:n,1:n) = a(1:n,1:n) * b(1:n,1:n);

  for i = 1 : n
    c(i,i) = c(i,i) - 1.0;
  end

  error_frobenius = c8mat_norm_fro ( n, n, c );

  return
end
