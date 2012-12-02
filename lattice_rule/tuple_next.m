function [ rank, x ] = tuple_next ( m1, m2, n, rank, x )

%*****************************************************************************80
%
%% TUPLE_NEXT computes the next element of a tuple space.
%
%  Discussion:
%
%    The elements are N vectors.  Each entry is constrained to lie
%    between M1 and M2.  The elements are produced one at a time.
%    The first element is
%      (M1,M1,...,M1),
%    the second element is
%      (M1,M1,...,M1+1),
%    and the last element is
%      (M2,M2,...,M2)
%    Intermediate elements are produced in lexicographic order.
%
%  Example:
%
%    N = 2, M1 = 1, M2 = 3
%
%    INPUT        OUTPUT
%    -------      -------
%    Rank  X      Rank   X
%    ----  ---    -----  ---
%    0     * *    1      1 1
%    1     1 1    2      1 2
%    2     1 2    3      1 3
%    3     1 3    4      2 1
%    4     2 1    5      2 2
%    5     2 2    6      2 3
%    6     2 3    7      3 1
%    7     3 1    8      3 2
%    8     3 2    9      3 3
%    9     3 3    0      0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M1, M2, the minimum and maximum entries.
%
%    Input, integer N, the number of components.
%
%    Input, integer RANK, counts the elements.
%    On first call, set RANK to 0.  On subsequent calls, the input value of
%    RANK should be the output value of RANK from the previous call.
%
%    Input, integer X(N), the previous tuple.
%
%    Output, integer RANK, the order of the next tuple.  When there are no
%    more elements, RANK will be returned as 0.
%
%    Output, integer X(N), the next tuple.
%
  if ( m2 < m1 )
    rank = 0;
    return
  end

  if ( rank <= 0 )

    x(1:n) = m1;
    rank = 1;

  else

    rank = rank + 1;
    i = n;

    while ( 1 )

      if ( x(i) < m2 )
        x(i) = x(i) + 1;
        break
      end

      x(i) = m1;

      if ( i == 1 )
        rank = 0;
        x(1:n) = m1;
        break
      end

      i = i - 1;

    end

  end

