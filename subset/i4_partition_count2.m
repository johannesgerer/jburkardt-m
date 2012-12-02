function p = i4_partition_count2 ( n )

%*****************************************************************************80
%
%% I4_PARTITION_COUNT2 computes the number of partitions of an integer.
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
%    01 August 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the largest integer to be considered.
%
%    Output, integer P(1:N+1), the partition numbers.
%
  if ( n < 0 )
    p = [];
    return
  end

  p(1) = 1;

  if ( n < 1 )
    return
  end

  p(2) = 1;

  for i = 2 : n

    total = 0;

    for t = 1 : i

      s = 0;
      j = i;

      while ( 1 )

        j = j - t;

        if ( 0 < j )
          s = s + p(j+1);
        else
          if ( j == 0 )
            s = s + 1;
          end
          break
        end

      end

      total = total + s * t;

    end

    p(i+1) = floor ( total / i );

  end

  return
end
