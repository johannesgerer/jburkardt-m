function [ n_data, n, m, fx ] = stirling2_values ( n_data )

%*****************************************************************************80
%
%% STIRLING2_VALUES returns some values of the Stirling numbers, kind 2.
%
%  Discussion:
%
%    S2(N,M) represents the number of distinct partitions of N elements
%    into M nonempty sets.  For a fixed N, the sum of the Stirling
%    numbers S2(N,M) is represented by B(N), called "Bell's number",
%    and represents the number of distinct partitions of N elements.
%
%    For example, with 4 objects, there are:
%
%    1 partition into 1 set:
%
%      (A,B,C,D)
%
%    7 partitions into 2 sets:
%
%      (A,B,C) (D)
%      (A,B,D) (C)
%      (A,C,D) (B)
%      (A) (B,C,D)
%      (A,B) (C,D)
%      (A,C) (B,D)
%      (A,D) (B,C)
%
%    6 partitions into 3 sets:
%
%      (A,B) (C) (D)
%      (A) (B,C) (D)
%      (A) (B) (C,D)
%      (A,C) (B) (D)
%      (A,D) (B) (C)
%      (A) (B,D) (C)
%
%    1 partition into 4 sets:
%
%      (A) (B) (C) (D)
%
%    So S2(4,1) = 1, S2(4,2) = 7, S2(4,3) = 6, S2(4,4) = 1, and B(4) = 15.
%
%
%  First terms:
%
%    N/M: 1    2    3    4    5    6    7    8
%
%    1    1    0    0    0    0    0    0    0
%    2    1    1    0    0    0    0    0    0
%    3    1    3    1    0    0    0    0    0
%    4    1    7    6    1    0    0    0    0
%    5    1   15   25   10    1    0    0    0
%    6    1   31   90   65   15    1    0    0
%    7    1   63  301  350  140   21    1    0
%    8    1  127  966 1701 1050  266   28    1
%
%    In Mathematica, the function can be evaluated by:
%
%      StirlingS2[n,m]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, M, the arguments of the function.
%
%    Output, integer FX, the value of the function.
%
  n_max = 16;

  fx_vec = [ ...
           0, ...
           1, ...
           3, ...
           7, ...
          15, ...
          31, ...
          63, ...
         127, ...
         255, ...
         511, ...
         966, ...
        1701, ...
        1050, ...
         266, ...
          28, ...
           1 ];

  m_vec = [ ...
     2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4, 5, 6, 7, 8 ];

  n_vec = [ ...
     1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 8, 8, 8, 8, 8, 8 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    m = 0;
    fx = 0;
  else
    n = n_vec(n_data);
    m = m_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
