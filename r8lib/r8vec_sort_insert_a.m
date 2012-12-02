function a = r8vec_sort_insert_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_INSERT_A ascending sorts an R8VEC using an insertion sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Algorithm 1.1,
%    Donald Kreher and Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998, page 11.
%
%  Parameters:
%
%    Input, integer N, the number of items in the vector.
%    N must be positive.
%
%    Input, real A(N), the array to be sorted;
%
%    Output, real A(N), the array has been sorted.
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
