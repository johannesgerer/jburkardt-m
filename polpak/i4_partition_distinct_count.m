function value = i4_partition_distinct_count ( n )

%*****************************************************************************80
%
%% I4_PARTITION_DISTINCT_COUNT returns any value of Q(N).
%
%  Discussion:
%
%    A partition of an integer N is a representation of the integer
%    as the sum of nonzero positive integers.  The order of the summands
%    does not matter.  The number of partitions of N is symbolized
%    by P(N).  Thus, the number 5 has P(N) = 7, because it has the 
%    following partitions:
%
%    5 = 5
%      = 4 + 1 
%      = 3 + 2 
%      = 3 + 1 + 1 
%      = 2 + 2 + 1 
%      = 2 + 1 + 1 + 1 
%      = 1 + 1 + 1 + 1 + 1
%
%    However, if we require that each member of the partition
%    be distinct, we are computing something symbolized by Q(N).
%    The number 5 has Q(N) = 3, because it has the following partitions 
%    into distinct parts:
%
%    5 = 5
%      = 4 + 1 
%      = 3 + 2 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
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
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%
%    Output, integer VALUE, the number of partitions of the integer
%    into distinct parts.
%
  c(1) = 1;

  for i = 1 : n

    if ( i4_is_triangular ( i ) )
      c(i+1) = 1;
    else
      c(i+1) = 0;
    end

    k = 0;
    k_sign = -1;

    while ( 1 )

      k = k + 1;
      k_sign = - k_sign;
      k2 = k * ( 3 * k + 1 );

      if ( i < k2 )
        break
      end

      c(i+1) = c(i+1) + k_sign * c(i-k2+1);

    end

    k = 0;
    k_sign = -1;

    while ( 1 )

      k = k + 1;
      k_sign = -k_sign;
      k2 = k * ( 3 * k - 1 );

      if ( i < k2 )
        break
      end

      c(i+1) = c(i+1) + k_sign * c(i-k2+1);

    end

  end

  value = c(n+1);

  return
end
