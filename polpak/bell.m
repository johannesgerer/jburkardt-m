function b = bell ( n )

%*****************************************************************************80
%
%% BELL returns the Bell numbers from 0 to N.
%
%  Discussion:
%
%    The Bell number B(N) is the number of restricted growth functions
%    on N.
%
%    Note that the Stirling numbers of the second kind, S^m_n, count the
%    number of partitions of N objects into M classes, and so it is
%    true that
%
%      B(N) = S^1_N + S^2_N + ... + S^N_N.
%
%  Definition:
%
%    The Bell number B(N) is defined as the number of partitions (of
%    any size) of a set of N distinguishable objects.
%
%    A partition of a set is a division of the objects of the set into
%    subsets.
%
%  Examples:
%
%    There are 15 partitions of a set of 4 objects:
%
%      (1234), (123)(4), (124)(3), (12)(34), (12)(3)(4),
%      (134)(2), (13)(24), (13)(2)(4), (14)(23), (1)(234),
%      (1)(23)(4), (14)(2)(3), (1)(24)(3), (1)(2)(34), (1)(2)(3)(4)
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
%    B(I) = sum ( 1 <= J <= I ) Binomial ( I-1, J-1 ) * B(I-J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of Bell numbers desired.
%
%    Output, integer B(1:N+1), the Bell numbers from 0 to N.
%
  b(1) = 1;

  for i = 1 : n
    b(i+1) = 0;
    for j = 1 : i
      b(i+1) = b(i+1) + i4_choose ( i-1, j-1 ) * b(i-j+1);
    end
  end

  return
end
