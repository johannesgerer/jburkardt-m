function indx_max = r8vec_indexed_heap_d_max ( n, a, indx )

%*****************************************************************************80
%
%% R8VEC_INDEXED_HEAP_D_MAX: maximum value in heap descending indexed R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    An indexed R8VEC is an R8VEC of data values, and an R8VEC of N indices,
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
%    Input, real A(*), the data vector.
%
%    Input, integer INDX(N), the index vector.
%
%    Output, integer INDX_MAX, the index in A of the maximum value
%    in the heap.
%
  indx_max = indx(1);

  return
end
