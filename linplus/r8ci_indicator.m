function a = r8ci_indicator ( n )

%*****************************************************************************80
%
%% R8CI_INDICATOR sets up a R8CI indicator matrix.
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
%    N must be positive.
%
%    Output, real A(N), the R8CI matrix.
%
  fac = 10 ^ ( i4_log_10 ( n ) + 1 );

  i = 1;

  for j = 1 : n
    a(j) = fac * i + j;
  end

  return
end
