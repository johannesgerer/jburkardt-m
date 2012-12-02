function a = r85_indicator ( n )

%*****************************************************************************80
%
%% R85_INDICATOR sets up a R85 indicator matrix.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
%
%    Here are the values as stored in an indicator matrix:
%
%      00 00 13 24 35 46
%      00 12 23 34 45 56
%      11 22 33 44 55 66
%      21 32 43 54 65 00
%      31 42 53 64 00 00
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 3.
%
%    Output, real A(5,N), the R85 indicator matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  a(1,1) = 0.0;
  a(1,2) = 0.0;
  for j = 3 : n
    i = j - 2;
    a(1,j) = fac * i + j;
  end

  a(2,1) = 0.0;
  for j = 2 : n
    i = j - 1;
    a(2,j) = fac * i + j;
  end

  for j = 1 : n
    i = j;
    a(3,j) = fac * i + j;
  end

  for j = 1 : n-1
    i = j + 1;
    a(4,j) = fac * i + j;
  end
  a(4,n) = 0.0;

  for j = 1 : n-2
    i = j + 2;
    a(5,j) = fac * i + j;
  end
  a(5,n-1) = 0.0;
  a(5,n) = 0.0;

  return
end
