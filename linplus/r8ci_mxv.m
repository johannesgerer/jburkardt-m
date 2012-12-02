function b = r8ci_mxv ( n, a, x )

%*****************************************************************************80
%
%% R8CI_MXV multiplies a R8CI matrix times a vector.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The format simply records the first row of the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N), the R8CI matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  for i = 1 : n
    b(i) = sum ( a(n+2-i:n) .* x(1:i-1) ) + sum ( a(1:n+1-i) .* x(i:n) );
  end

  return
end
