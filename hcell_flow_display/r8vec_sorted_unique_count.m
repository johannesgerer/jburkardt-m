function unique_num = r8vec_sorted_unique_count ( n, a, tol )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE_COUNT counts the unique elements in a sorted R8VEC.
%
%  Discussion:
%
%    Because the array is sorted, this algorithm is O(N).
%
%    If the tolerance is large enough, then the concept of uniqueness
%    can become ambiguous.  If we have a tolerance of 1.5, then in the
%    list ( 1, 2, 3, 4, 5, 6, 7, 8, 9 ) is it fair to say we have only
%    one unique entry?  That would be because 1 may be regarded as unique,
%    and then 2 is too close to 1 to be unique, and 3 is too close to 2 to
%    be unique and so on.
%
%    This seems wrongheaded.  So I prefer the idea that an item is not
%    unique under a tolerance only if it is close to something that IS unique.
%    Thus, the unique items are guaranteed to cover the space if we include
%    a disk of radius TOL around each one.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), the sorted array to examine.
%
%    Input, real TOL, a nonnegative tolerance for equality.
%
%    Output, integer UNIQUE_NUM, the number of unique elements of A.
%
  unique_num = 0;

  if ( n < 1 )
    return;
  end

  unique_num = 1;
  j1 = 1;

  for j2 = 2 : n

    if ( tol < abs ( a(j1) - a(j2) ) )
      unique_num = unique_num + 1;
      j1 = j2;
    end

  end

  return
end
