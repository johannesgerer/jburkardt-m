function b = r8ci_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R8CI_TO_R8GE copies a R8CI matrix into a R8GE matrix.
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
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    b(i,1:i-1) = a(n+2-i:n+2*1-2*i);
    b(i,i:n) = a(1:n+1-i);
  end

  return
end
