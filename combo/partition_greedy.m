function [ a, indx ] = partition_greedy ( n, a )

%*****************************************************************************80
%
%% PARTITION_GREEDY attacks the partition problem with a greedy algorithm.
%
%  Discussion:
%
%    Given a collection of N not necessarily distinct positive integers A(I),
%    it is desired to partition the values into two groups, whose sums are
%    as close as possible.
%
%  Algorithm:
%
%    Begin with sets 1 and 2 empty.
%
%    Process the data in descending order of magnitude.
%
%    The next item A(I) is added to set 1 or set 2, whichever has the
%    smallest current sum.
%
%    Stop as soon as all items have been allocated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Brian Hayes,
%    The Easiest Hard Problem,
%    American Scientist,
%    Volume 90, Number 2, March-April 2002, pages 113-117.
%
%  Parameters:
%
%    Input, integer N, the number of values.  N must be positive.
%
%    Input/output, integer A(N), a collection of positive values.
%    On output, A has been sorted into descending order.
%
%    Output, integer INDX(N); INDX(I) is 1 if A(I) is part of
%    set 1, and 2 if it is assigned to set 2.
%
  sums(1:2) = 0;

  a = i4vec_sort_insert_d ( n, a );

  for i = 1 : n

    if ( sums(1) < sums(2) )
      j = 1;
    else
      j = 2;
    end

    indx(i) = j;
    sums(j) = sums(j) + a(i);

  end

  return
end
