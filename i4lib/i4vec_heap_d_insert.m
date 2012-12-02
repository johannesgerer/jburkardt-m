function [ n, a ] = i4vec_heap_d_insert ( n, a, value )

%*****************************************************************************80
%
%% I4VEC_HEAP_D_INSERT inserts a new value into a descending heap.
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
%    17 October 2006
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
%    Input, integer VALUE, the value to be inserted.
%
%    Output, integer N, the number of items in the heap.
%
%    Output, integer A(N), the heap.
%
  n = n + 1;
  i = n;

  while ( 1 < i )

    parent = floor ( i / 2 );

    if ( value <= a(parent) )
      break
    end

    a(i) = a(parent);
    i = parent;

  end

  a(i) = value;

  return
end
