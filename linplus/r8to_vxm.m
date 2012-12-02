function b = r8to_vxm ( n, a, x )

%*****************************************************************************80
%
%% R8TO_VXM multiplies a vector by a R8TO matrix.
%
%  Discussion:
%
%    The R8TO storage format is used for a Toeplitz matrix, which is constant
%    along diagonals.  Thus, in an N by N Toeplitz matrix, there are at most 
%    2*N-1 distinct entries.  The format stores the N elements of the first
%    row, followed by the N-1 elements of the first column (skipping the
%    entry in the first row).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(2*N-1), the R8TO matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A' * X.
%
  for i = 1 : n

    b(i) = a(i:-1:1) * x(1:i)' + a(n+1:2*n-i) * x(i+1:n)';

  end

  return
end
