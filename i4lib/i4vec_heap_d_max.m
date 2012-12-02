function val_max = i4vec_heap_d_max ( n, a )

%*****************************************************************************80
%
%% I4VEC_HEAP_D_MAX returns the maximum in a descending heap of integers.
%
%  Discussion:
%
%    An I4VEC is a vector of integer values.
%
%    This is one of three functions needed to model a priority queue.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Cormen, Charles Leiserson, Ronald Rivest,
%    Introduction to Algorithms,
%    MIT Press, page 150.
%
%  Parameters:
%
%    Input, integer N, the number of items in the heap.
%
%    Input, integer A(N), the heap.
%
%    Output, integer VAL_MAX, the maximum value in the heap.
%
  val_max = a(1);

  return
end
