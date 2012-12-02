function unique_num = r8col_sorted_tol_unique_count ( m, n, a, tol )

%*****************************************************************************80
%
%% R8COL_SORTED_TOL_UNIQUE_COUNT counts tolerably unique elements in an R8COL.
%
%  Discussion:
%
%    An R8COL is an M by N array of R8 values, regarded
%    as an array of N columns of length M.
%
%    The columns of the array may be ascending or descending sorted.
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
%    19 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), a sorted array, containing
%    N columns of data.
%
%    Input, real TOL, a tolerance.
%
%    Output, integer UNIQUE_NUM, the number of unique columns.
%
  undx = zeros ( n, 1 );
%
%  Consider entry I = 1.
%  It is unique, so set the number of unique items to K.
%  Set the K-th unique item to I.
%  Set the representative of item I to the K-th unique item.
%
  i = 1;
  k = 1;
  undx(k) = i;
%
%  Consider entry I.
%
%  If it is unique, increase the unique count K, set the
%  K-th unique item to I, and set the representative of I to K.
%
%  If it is not unique, set the representative of item I to a
%  previously determined unique item that is close to it.
%
  for i = 2 : n

    unique = 1;

    for j = 1 : k
      i2 = undx(j);
      diff = max ( abs ( a(1:m,i) - a(1:m,i2) ) );
      if ( diff <= tol )
        unique = 0;
        break
      end
    end

    if ( unique )
      k = k + 1;
      undx(k) = i;
    end

  end

  unique_num = k;

  return
end
