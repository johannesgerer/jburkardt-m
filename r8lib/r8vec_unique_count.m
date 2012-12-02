function unique_num = r8vec_unique_count ( n, a, tol )

%*****************************************************************************80
%
%% R8VEC_UNIQUE_COUNT counts the unique elements in an unsorted R8VEC.
%
%  Discussion:
%
%    Because the array is unsorted, this algorithm is O(N^2).
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
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), the unsorted array to examine.
%
%    Input, real TOL, a nonnegative tolerance for equality.
%
%    Output, integer UNIQUE_NUM, the number of unique elements of A.
%
  unique_num = 0;

  for i1 = 1 : n

    unique_num = unique_num + 1;
    unique(i1) = 1;

    for i2 = 1 : i1 - 1

      if ( unique(i2) )
        if ( abs ( a(i1) - a(i2) ) <= tol )
          unique_num = unique_num - 1;
          unique(i1) = 0;
          break
        end
      end

    end

  end

  return
end
