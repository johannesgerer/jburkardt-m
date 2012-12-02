function a = i4vec_sort_insert_a ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_INSERT_A uses an ascending insertion sort on an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher and Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998, page 11.
%
%  Parameters:
%
%    Input, integer N, the number of items in the vector.
%    N must be positive.
%
%    Input, integer A(N), the array to be sorted.
%
%    Output, integer A(N), the sorted array.
%
  for i = 2 : n

    x = a(i);

    j = i - 1;

    while ( 1 <= j )

      if ( a(j) <= x )
        break
      end

      a(j+1) = a(j);
      j = j - 1;

    end

    a(j+1) = x;

  end

  return
end
