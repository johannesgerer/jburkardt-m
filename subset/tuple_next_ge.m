function [ rank, x ] = tuple_next_ge ( m, n, rank, x )

%*****************************************************************************80
%
%% TUPLE_NEXT_GE computes the next "nondecreasing" element of a tuple space.
%
%  Discussion:
%
%    The elements are N vectors.  Each element is constrained to lie
%    between 1 and M, and to have components that are nondecreasing.
%    That is, for an element X, and any positive K,
%      X(I) <= X(I+K)
%
%    The elements are produced one at a time.
%    The first element is
%      (1,1,...,1)
%    and the last element is
%      (M,M,...,M)
%    Intermediate elements are produced in lexicographic order.
%
%  Example:
%
%    N = 3, M = 3
%
%    RANK   X
%    ----  -----
%       1  1 1 1
%       2  1 1 2
%       3  1 1 3
%       4  1 2 2
%       5  1 2 3
%       6  1 3 3
%       7  2 2 2
%       8  2 2 3
%       9  2 3 3
%      10  3 3 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2004
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
%    Input, integer RANK, the rank of the input tuple.
%    On first call, set K to 0.  Thereafter, K will indicate the
%    order of the element returned.  When there are no more elements,
%    K will be returned as 0.
%
%    Input, integer X(N), on input the previous tuple (except
%    on the first call, when the input value of X is not needed.)
%    On output, the next tuple.
%
%    Output, integer RANK, the rank of the output tuple.
%    When there are no more elements, RANK will be returned as 0.
%
%    Output, integer X(N), on input the previous tuple (except
%    on the first call, when the input value of X is not needed.)
%    On output, the next tuple.
%
  if ( m < 1 )
    return
  end

  if ( rank <= 0 )
    x(1:n) = 1;
    rank = 1;
    return
  end

  for i = n : -1 : 1

    if ( x(i) < m )
      x(i) = x(i) + 1;
      x(i+1:n) = x(i);
      rank = rank + 1;
      return
    end

  end

  rank = 0;
  x(1:n) = 0;

  return
end
