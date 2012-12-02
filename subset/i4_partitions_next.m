function m = i4_partitions_next ( s, m )

%*****************************************************************************80
%
%% I4_PARTITIONS_NEXT: next partition into S parts.
%
%  Discussion:
%
%    This function generates, one at a time, entries from the list of
%    nondecreasing partitions of the integers into S or fewer parts.
%
%    The list is ordered first by the integer that is partitioned
%    (the sum of the entries), and second by decreasing lexical order
%    in the partition vectors.
%
%    The first value returned is the only such partition of 0.
%
%    Next comes the only partition of 1.
%
%    There follow two partitions of 2, and so on.
%
%    Typical use of this function begins with an initialization call,
%    and then repeated calls in which the output from the previous call
%    is used as input to the next call:
%
%    m = [ 0, 0, 0 ];
%
%    while ( condition )
%      m = i4_partitions_next ( s, m );
%    end
%
%  Example:
%
%    S = 3
%
%    P  D    M
%    _  _  _____
%    1  0  0 0 0
%    2  1  1 0 0
%    3  2  2 0 0
%    4  2  1 1 0
%    5  3  3 0 0
%    6  3  2 1 0
%    7  3  1 1 1
%    8  4  4 0 0
%    9  4  3 1 0
%   10  4  2 2 0
%   11  4  2 1 1
%   12  5  5 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2010
%
%  Author:
%
%    Original MATLAB version by Alan Genz.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer S, the number of items in the partition.
%
%    Input, integer M(S), the current partition.  On first call, this
%    should be a nondecreasing partition.  Thereafter, it should be the
%    output partition from the previous call.
%
%    Output, integer M(S), the next partition.
%
  msum = m(1);

  for i = 2 : s

    msum = msum + m(i);

    if ( m(1) <= m(i) + 1 )
      m(i) = 0;
    else
      m(1) = msum - ( i - 1 ) * ( m(i) + 1 );
      m(2:i) = m(i) + 1;
      return
    end

  end
%
%  If we failed to find a suitable index I, put
%  the entire sum into M(1), increment by 1, and
%  prepare to partition the next integer.
%
  m(1) = msum + 1;

  return
end
