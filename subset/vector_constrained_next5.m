function [ x, more ] = vector_constrained_next5 ( n, x, sum_min, sum_max, more )

%*****************************************************************************80
%
%% VECTOR_CONSTRAINED_NEXT5 returns the "next" constrained vector.
%
%  Discussion:
%
%    We consider all positive integer vectors of dimension N whose
%    components satisfy SUM_MIN <= X(1:N) <= SUM_MAX.
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, exactly those vectors which satisfy
%    the constraint.
%
%  Example:
%
%    N = 3
%    SUM_MIN = 5
%    SUM_MAX = 6
%
%    #  X(1)  X(2)  X(3)     SUM
%
%    1    3     1     1        5
%    2    2     2     1        5
%    3    2     1     2        5
%    4    1     3     1        5
%    5    1     2     2        5
%    6    1     1     3        5
%
%    7    4     1     1        6
%    8    3     2     1        6
%    9    3     1     2        6
%   10    2     3     1        6
%   11    2     2     2        6
%   12    2     1     3        6
%   13    1     4     1        6
%   14    1     3     2        6
%   15    1     2     3        6
%   16    1     1     4        6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components in the vector.
%
%    Input, integer SUM_MIN, SUM_MAX, the minimum and maximum sums..
%
%    Input, integer X(N).  On first call (with MORE = FALSE),
%    the input value of X is not important.  On subsequent calls, the
%    input value of X should be the output value from the previous call.
%
%    Input, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.
%
%    Output, integer X(N). (with MORE = TRUE), the value of X will be the "next"
%    vector in the reverse lexicographical list of vectors that satisfy
%    the condition.  However, on output with MORE = FALSE, the vector
%    X is meaningless, because there are no more vectors in the list.
%
%    Output, logical MORE.  if MORE is TRUE,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
  persistent base;
%
%  Initialization.
%
  if ( ~more )

    if ( sum_max < n )
      more = 0;
      return
    end

    if ( sum_max < sum_min )
      more = 0;
      return;
    end

    more = 1;

    base = max ( sum_min, n );

    x(1) = base - n + 1;
    x(2:n) = 1;

    return
%
%  Next element.
%
  else
%
%  Search from the right, seeking an index I < N for which 1 < X(I).
%
    for i = n-1 : -1 : 1
%
%  If you find such an I, decrease X(I) by 1, and add that to X(I+1).
%
      if ( 1 < x(i) )

        x(i)   = x(i)   - 1;
        x(i+1) = x(i+1) + 1;
%
%  Now grab all the "excess" 1's from the entries to the right of X(I+1).
%
        for j = i+2 : n
          if ( 1 < x(j) )
            x(i+1) = x(i+1) + x(j) - 1;
            x(j) = 1;
          end
        end

        return

      end

    end
%
%  The current vector is (1,1,1,...,BASE-N+1).
%  If BASE < SUM_MAX, then increase BASE by 1, and start the new series.
%
    if ( base < sum_max )
      base = base + 1;
      x(1) = base - n + 1;
      x(2:n) = 1;
      return
    end
%
%  We returned the last legal vector on the previous call.
%  The calculation is done.
%
    more = 0;

  end

  return
end
