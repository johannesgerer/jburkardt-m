function a = r8vec_sort_bubble_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_BUBBLE_A ascending sorts an R8VEC using bubble sort.
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
%    24 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), an unsorted array.
%
%    Output, real A(N), the array has been sorted.
%
  for i = 1 : n-1
    for j = i + 1 : n
      if ( a(j) < a(i) )
        t    = a(i);
        a(i) = a(j);
        a(j) = t;
      end
    end
  end

  return
end
