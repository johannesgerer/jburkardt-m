function value = simplex_num ( m, n )

%*****************************************************************************80
%
%% SIMPLEX_NUM evaluates the N-th Simplex number in M dimensions.
%
%  Discussion:
%
%     N\M: 1    2    3    4    5
%    --   --   --   --   --   --
%     0    0    0    0    0    0
%     1    1    1    1    1    1
%     2    2    3    4    5    6
%     3    3    6   10   15   21
%     4    4   10   20   35   56
%     5    5   15   35   70  126
%     6    6   21   56  126  252
%     7    7   28   84  210  462
%     8    8   36  120  330  792
%     9    9   45  165  495 1287
%    10   10   55  220  715 2002
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the index of the number.
%
%    Output, integer VALUE, the desired value.
%
  value = 1;
  for i = 1 : m
    value = ( value * ( n + i - 1 ) ) / i;
  end

  return
end