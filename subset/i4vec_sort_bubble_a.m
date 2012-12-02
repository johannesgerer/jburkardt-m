function a = i4vec_sort_bubble_a ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_BUBBLE_A ascending sorts an integer vector using bubble sort.
%
%  Discussion:
%
%    Bubble sort is simple to program, but inefficient.  It should not
%    be used for large arrays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), an unsorted array.
%
%    Output, integer A(N), the array has been sorted.
%
  for i = 1 : n-1
    for j = i+1 : n
      if ( a(j) < a(i) )
        t        = a(i);
        a(i) = a(j);
        a(j) = t;
      end
    end
  end

  return
end
