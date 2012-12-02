function unique_num = r8col_unique_count ( m, n, a )

%*****************************************************************************80
%
%% R8COL_UNIQUE_COUNT counts the unique columns in an unsorted R8COL.
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
%    17 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, real A(M,N), the unsorted array.
%
%    Output, integer UNIQUE_NUM, the number of unique columns of A.
%
  unique_num = 0;

  for j1 = 1 : n

    unique_num = unique_num + 1;
    unique(j1) = 1;

    for j2 = 1 : j1 - 1

      if ( unique(j2) )
        diff = max ( abs ( a(1:m,j1) - a(1:m,j2) ) );
        if ( diff == 0.0 )
          unique_num = unique_num - 1;
          unique(j1) = 0;
          break
        end
      end

    end

  end

  return
end
