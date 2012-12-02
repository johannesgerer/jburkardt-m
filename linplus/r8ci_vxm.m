function b = r8ci_vxm ( n, a, x )

%*****************************************************************************80
%
%% R8CI_VXM multiplies a vector by a R8CI matrix.
%
%  Discussion:
%
%    The R8CI storage format is used for an N by N circulant matrix.
%    An N by N circulant matrix A has the property that the entries on
%    row I appear again on row I+1, shifted one position to the right,
%    with the final entry of row I appearing as the first of row I+1.
%    The R8CI format simply records the first row of the matrix.
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
%    Output, real B(N), the product A' * X.
%
  for i = 1 : n
    b(i) = sum ( a(i:-1:1) .* x(1:i) ) + sum ( a(n:-1:i+1) .* x(i+1:n) );
  end

  return
end
