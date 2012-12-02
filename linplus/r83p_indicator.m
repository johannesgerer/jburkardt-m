function a = r83p_indicator ( n )

%*****************************************************************************80
%
%% R83P_INDICATOR sets up a R83P indicator matrix.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as 
%    a 3 by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  The matrix value 
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
%
%    Here are the values as stored in an indicator matrix:
%
%      51 12 23 34 45
%      11 22 33 44 55
%      21 32 43 54 15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2004
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
%    Output, real A(3,N), the R83P indicator matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  i = n;
  j = 1;
  a(1,j) = fac * i + j;
  for j = 2: n
    i = j - 1;
    a(1,j) = fac * i + j;
  end

  for j = 1 : n
    i = j;
    a(2,j) = fac * i + j;
  end

  for j = 1 : n-1
    i = j + 1;
    a(3,j) = fac * i + j;
  end
  i = 1;
  j = n;
  a(3,j) = fac * i + j;

  return
end
