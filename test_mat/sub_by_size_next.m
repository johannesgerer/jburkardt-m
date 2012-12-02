function [ a, size, more ] = sub_by_size_next ( n, a, size, more )

%*****************************************************************************80
%
%% SUB_BY_SIZE_NEXT returns all subsets of an N set, in order of size.
%
%  Example:
%
%    N = 4:
%
%    1 2 3 4
%    1 2 3
%    1 2 4
%    1 3 4
%    1 3
%    1 4
%    2 3
%    1
%    2
%    3
%    (the empty set)
%
%  Discussion:
%
%    The subsets are returned in decreasing order of size, with the
%    empty set last.
%
%    For a given size K, the K subsets are returned in lexicographic order.
%
%    On the first call, it is only important that MORE be set FALSE.  The
%    input values of A and SIZE are not important.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the set.
%
%    Input, integer A(N), the previous output subset.
%
%    Input, integer SIZE, the size of the previous output subset.
%
%    Input, logical MORE, is FALSE on the first call, which signals
%    the routine to initialize itself.  Thereafter, MORE should be TRUE.
%
%    Output, integer A(N), the next subset.
%
%    Output, integer SIZE, the size of the next subset.
%
%    Output, logical MORE, is TRUE as long as there are even more subsets
%    that can be produced by further calls.
%
  persistent more2;

  if ( ~more )
    more = 1;
    more2 = 0;
    size = n;
  else
    if ( ~more2 )
      size = size - 1;
    end
  end
%
%  Compute the next subset of size SIZE.
%
  if ( 0 < size )
    [ a, more2 ] = ksub_next ( n, size, a, more2 );
  else
    a = [];
    more = 0;
  end

  return
end
