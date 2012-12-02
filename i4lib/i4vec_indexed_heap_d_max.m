function indx_max = i4vec_indexed_heap_d_max ( n, a, indx )

%*****************************************************************************80
%
%% I4VEC_INDEXED_HEAP_D_MAX: maximum value in heap descending indexed I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%    An indexed I4VEC is an I4VEC of data values, and an I4VEC of N indices,
%    each referencing an entry of the data vector.
%
%    This is one of three functions needed to model a priority queue.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Cormen, Charles Leiserson, Ronald Rivest,
%    Introduction to Algorithms,
%    MIT Press, 2001,
%    ISBN: 0262032937,
%    LC: QA76.C662.
%
%  Parameters:
%
%    Input, integer N, the number of items in the index vector.
%
%    Input, integer A(*), the data vector.
%
%    Input, integer INDX(N), the index vector.
%
%    Output, integer INDX_MAX, the index in A of the maximum value
%    in the heap.
%
  indx_max = indx(1);

  return
end
