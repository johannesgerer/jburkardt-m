function [ indx_extract, n, indx ] = r8vec_indexed_heap_d_extract ( n, a, indx )

%*****************************************************************************80
%
%% R8VEC_INDEXED_HEAP_D_EXTRACT: extract from heap descending indexed R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    An indexed R8VEC is an R8VEC of data values, and an R8VEC of N indices,
%    each referencing an entry of the data vector.
%
%    The routine finds the maximum value in the heap, returns that value to the
%    user, deletes that value from the heap, and restores the heap to its
%    proper form.
%
%    Note that the argument N must be a variable, which will be decremented
%    before return, and that INDX will hold one less value on output than it
%    held on input.
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
%    Output, integer INDX_EXTRACT, the index in A of the item of
%    maximum value, which has now been removed from the heap.
%
%    Output, integer N, the number of items in the revised index vector.
%
%    Output, integer INDX(N), the revised index vector.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_INDEXED_HEAP_D_EXTRACT - Fatal error!\n' );
    fprintf ( 1, '  The heap is empty.\n' );
    error ( 'R8VEC_INDEXED_HEAP_D_EXTRACT - Fatal error!' )
  end
%
%  Get the index of the maximum value.
%
  indx_extract = indx(1);

  if ( n == 1 )
    n = 0;
    indx = [];
    return
  end
%
%  Shift the last index down.
%
  indx(1) = indx(n);
%
%  Restore the heap structure.
%
  n = n - 1;
  indx = r8vec_indexed_heap_d ( n, a, indx );

  return
end
