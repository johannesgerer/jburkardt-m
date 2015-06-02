function indx = r8vec_sort_insert_index_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_INSERT_INDEX_A ascending index sorts an R8VEC using insertion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
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
%    Input, real A(N), the array to be sorted.
%
%    Output, integer INDX(N), the sorted indices.  The array is sorted
%    when listed from A(INDX(1)) through A(INDX(N)).
%
  if ( n < 1 )
    return
  end

  indx = i4vec_indicator1 ( n );

  for i = 2 : n

    x = a(i);

    j = i - 1;

    while ( 1 <= j )

      if ( a(indx(j)) <= x )
        break
      end 

      indx(j+1) = indx(j);
      j = j - 1;

    end

    indx(j+1) = i;

  end

  return
end
