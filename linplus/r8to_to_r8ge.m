function b = r8to_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R8TO_TO_R8GE copies a R8TO matrix to a R8GE matrix.
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    b(i,1:i-1) = a(n+i-1:-1:n+1,1);
    b(i,i:n) = a(1:n-i+1,1);
  end

  return
end
