function s = involute_enum ( n )

%*****************************************************************************80
%
%% INVOLUTE_ENUM enumerates the involutions of N objects.
%
%  Discussion:
%
%    An involution is a permutation consisting only of fixed points and
%    pairwise transpositions.
%
%    An involution is its own inverse permutation.
%
%  Recursion:
%
%    S(0) = 1
%    S(1) = 1
%    S(N) = S(N-1) + (N-1) * S(N-2)
%
%  First values:
%
%     N         S(N)
%     0           1
%     1           1
%     2           2
%     3           4
%     4          10
%     5          26
%     6          76
%     7         232
%     8         764
%     9        2620
%    10        9496
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects to be permuted.
%
%    Output, integer S(1:N+1), the number of involutions of 0, 1, 2, ... N
%    objects.
%
  if ( n < 0 )
    s = [];
    return
  end

  s(1) = 1;

  if ( n <= 0 )
    return
  end

  s(2) = 1;

  for i = 2 : n
    s(i+1) = s(i) + ( i - 1 ) * s(i-1);
  end

  return
end
