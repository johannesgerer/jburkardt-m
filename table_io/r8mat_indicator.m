function table = r8mat_indicator ( m, n )

%*****************************************************************************80
%
%% R8MAT_INDICATOR sets up an indicator R8MAT.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%    The value of each entry suggests its location, as in:
%
%      11  12  13  14
%      21  22  23  24
%      31  32  33  34
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Output, real TABLE(M,N), the indicator table.
%
  table = zeros ( m, n );

  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : m
    for j = 1 : n
      table(i,j) = fac * i + j;
    end
  end

  return
end
