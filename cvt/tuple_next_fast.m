function x = tuple_next_fast ( m, n, rank )

%*****************************************************************************80
%
%% TUPLE_NEXT_FAST computes the next element of a tuple space, "fast".
%
%  Discussion:
%
%    The elements are N vectors.  Each entry is constrained to lie
%    between 1 and M.  The elements are produced one at a time.
%    The first element is
%      (1,1,...,1)
%    and the last element is
%      (M,M,...,M)
%    Intermediate elements are produced in lexicographic order.
%
%    This code was written as a possibly faster version of TUPLE_NEXT.
%
%  Example:
%
%    N = 2,
%    M = 3
%
%    INPUT        OUTPUT
%    -------      -------
%    Rank          X
%    ----          ----
%   -1            -1 -1
%    0             1  1
%    1             1  2
%    2             1  3
%    3             2  1
%    4             2  2
%    5             2  3
%    6             3  1
%    7             3  2
%    8             3  3
%    9             1  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the maximum entry.
%
%    Input, integer N, the number of components.
%
%    Input, integer RANK, indicates the rank of the tuples.
%    However, if RANK < 0, this indicates that this is the first
%    call for the given values of (M,N).  Initialization is done,
%    and X is set to a dummy value.
%
%    Output, integer X(N), the next tuple of the given rank.
%
  global tuple_next_fast_BASE

  if ( rank < 0 )

    tuple_next_fast_BASE(n) = 1;
    for i = n-1 : -1 : 1
      tuple_next_fast_BASE(i) = tuple_next_fast_BASE(i+1) * m;
    end

    x(1:n) = -1;

  else

    x(1:n) = mod ( floor ( rank ./ tuple_next_fast_BASE(1:n) ), m ) + 1;

  end

  return
end
