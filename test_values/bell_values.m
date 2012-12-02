function [ n_data, n, c ] = bell_values ( n_data )

%*****************************************************************************80
%
%% BELL_VALUES returns some values of the Bell numbers.
%
%  Discussion:
%
%    The Bell number B(N) is the number of restricted growth functions on N.
%
%    Note that the Stirling numbers of the second kind, S^m_n, count the
%    number of partitions of N objects into M classes, and so it is
%    true that
%
%      B(N) = S^1_N + S^2_N + ... + S^N_N.
%
%    The Bell numbers were named for Eric Temple Bell.
%
%    In Mathematica, the function can be evaluated by
%
%      Sum[StirlingS2[n,m],{m,1,n}]
%
%    The Bell number B(N) is defined as the number of partitions (of
%    any size) of a set of N distinguishable objects.  
%
%    A partition of a set is a division of the objects of the set into 
%    subsets.
%
%  Example:
%
%    There are 15 partitions of a set of 4 objects:
%
%      (1234), 
%      (123) (4), 
%      (124) (3), 
%      (12) (34), 
%      (12) (3) (4), 
%      (134) (2), 
%      (13) (24), 
%      (13) (2) (4), 
%      (14) (23), 
%      (1) (234),
%      (1) (23) (4), 
%      (14) (2) (3), 
%      (1) (24) (3), 
%      (1) (2) (34), 
%      (1) (2) (3) (4).
%
%    and so B(4) = 15.
%
%  First values:
%
%     N         B(N)
%     0           1
%     1           1
%     2           2
%     3           5
%     4          15
%     5          52
%     6         203
%     7         877
%     8        4140
%     9       21147
%    10      115975
%
%  Recursion:
%
%    B(I) = sum ( 1 <= J <=I ) Binomial ( I-1, J-1 ) * B(I-J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2004
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
%    Output, integer N, the order of the Bell number.
%
%    Output, integer C, the value of the Bell number.
%
  n_max = 11;

  c_vec = [ ...
    1, 1, 2, 5, 15, 52, 203, 877, 4140, 21147, 115975 ];

  n_vec = [ ...
     0,  1,  2,  3,  4, 5,  6,  7,  8,  9,  10 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    c = 0;
  else
    n = n_vec(n_data);
    c = c_vec(n_data);
  end

  return
end
