function [ n_data, n, m, fx ] = stirling1_values ( n_data )

%*****************************************************************************80
%
%% STIRLING1_VALUES returns some values of the Stirling numbers, kind 1.
%
%  Discussion:
%
%    The absolute value of the Stirling number S1(N,M) gives the number
%    of permutations on N objects having exactly M cycles, while the
%    sign of the Stirling number records the sign (odd or even) of
%    the permutations.  For example, there are six permutations on 3 objects:
%
%      A B C   3 cycles (A) (B) (C)
%      A C B   2 cycles (A) (BC)
%      B A C   2 cycles (AB) (C)
%      B C A   1 cycle  (ABC)
%      C A B   1 cycle  (ABC)
%      C B A   2 cycles (AC) (B)
%
%    There are 
%
%      2 permutations with 1 cycle, and S1(3,1) = 2
%      3 permutations with 2 cycles, and S1(3,2) = -3,
%      1 permutation with 3 cycles, and S1(3,3) = 1.
%
%    Since there are N! permutations of N objects, the sum of the absolute 
%    values of the Stirling numbers in a given row, 
%
%      sum ( 1 <= I <= N ) abs ( S1(N,I) ) = N!
%
%  First terms:
%
%    N/M:  1     2      3     4     5    6    7    8
%
%    1     1     0      0     0     0    0    0    0
%    2    -1     1      0     0     0    0    0    0
%    3     2    -3      1     0     0    0    0    0
%    4    -6    11     -6     1     0    0    0    0
%    5    24   -50     35   -10     1    0    0    0
%    6  -120   274   -225    85   -15    1    0    0
%    7   720 -1764   1624  -735   175  -21    1    0
%    8 -5040 13068 -13132  6769 -1960  322  -28    1
%
%    In Mathematica, the function can be evaluated by:
%
%      StirlingS1[n,m]
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
          -3, ...
          11, ...
         -50, ...
         274, ...
       -1764, ...
       13068, ...
     -109584, ...
     1026576, ...
      -13132, ...
        6769, ...
       -1960, ...
         322, ...
         -28, ...
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
