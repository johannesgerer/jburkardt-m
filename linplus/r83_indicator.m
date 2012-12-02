function a = r83_indicator ( n )

%*****************************************************************************80
%
%% R83_INDICATOR sets up a R83 indicator matrix.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%    Here are the values as stored in an indicator matrix:
%
%      00 12 23 34 45
%      11 22 33 44 55
%      21 32 43 54 00
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 2.
%
%    Output, real A(3,N), the R83 indicator matrix.
%
  fac = 10 ^ ( i4_log_10 ( n ) + 1 );

  a(1,1) = 0.0;
  for j = 2 : n
    i = j - 1;
    a(1,j) = ( fac * i + j );
  end

  for j = 1 : n
    i = j;
    a(2,j) = ( fac * i + j );
  end

  for j = 1 : n-1
    i = j + 1;
    a(3,j) = ( fac * i + j );
  end
  a(3,n) = 0.0;

  return
end
