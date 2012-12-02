function p = i4_partition_count ( n )

%*****************************************************************************80
%
%% I4_PARTITION_COUNT computes the number of partitions of an integer.
%
%  Discussion:
%
%    Partition numbers are difficult to compute.  This routine uses
%    Euler's method, which observes that:
%
%      P(0) = 1
%      P(N) =   P(N-1)  + P(N-2)
%             - P(N-5)  - P(N-7)
%             + P(N-12) + P(N-15)
%             - ...
%
%      where the numbers 1, 2, 5, 7, ... to be subtracted from N in the
%      indices are the successive pentagonal numbers, (with both positive 
%      and negative indices) with the summation stopping when a negative 
%      index is reached.
%
%  First values:
%
%    N   P
%
%    0   1
%    1   1
%    2   2
%    3   3
%    4   5
%    5   7
%    6  11
%    7  15
%    8  22
%    9  30
%   10  42
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Conway and Richard Guy,
%    The Book of Numbers,
%    Springer Verlag, 1996, page 95.
%
%  Parameters:
%
%    Input, integer N, the index of the highest partition number desired.
%
%    Output, integer P(1:N+1), the partition numbers.
%
  p(1) = 1;

  for i = 1 : n

    p(i+1) = 0;

    j = 0;
    sgn = 1;

    while ( 1 )

      j = j + 1;
      pj = pent_enum ( j );

      if ( i < pj )
        break
      end

      p(i+1) = p(i+1) + sgn * p(i-pj+1);
      sgn = -sgn;

    end

    j = 0;
    sgn = 1;

    while ( 1 )

      j = j - 1;
      pj = pent_enum ( j );

      if ( i < pj )
        break
      end

      p(i+1) = p(i+1) + sgn * p(i-pj+1);
      sgn = -sgn;

    end

  end

  return
end
