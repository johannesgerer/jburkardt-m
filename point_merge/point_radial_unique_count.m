function [ unique_num, seed ] = point_radial_unique_count ( m, n, a, seed )

%*****************************************************************************80
%
%% POINT_RADIAL_UNIQUE_COUNT counts the unique points.
%
%  Discussion:
%
%    The input data is an M x N array A, representing the M-dimensional
%    coordinates of N points.
%
%    The output is the number of unique points in the list.
%
%    This program performs the same task as POINT_UNIQUE_COUNT, and
%    carries out more work.  Hence, it is not a substitute for
%    POINT_UNIQUE_COUNT.  Instead, it is intended to be a starting point
%    for a similar program which includes a tolerance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2010
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
%    Input, real A(M,N), the array of N columns of data.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer UNIQUE_NUM, the number of unique points.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end
%
%  Assign a base point Z randomly in the convex hull.
%
  [ w, seed ] = r8vec_uniform_01 ( n, seed );

  for i = 1 : m
    z(i,1) = a(i,1:n) * w(1:n,1) / sum ( w(1:n) );
  end
%
%  Compute the radial distance R of each point to Z.
%
  for j = 1 : n
    r(j,1) = sqrt ( sum ( ( a(1:m,j) - z(1:m) ).^2 ) );
  end
%
%  Implicitly sort the R array.
%
  indx = r8vec_sort_heap_index_a ( n, r );
%
%  To determine if a point is unique, we only have to check
%  whether it is distinct from all points with the same
%  R value and lower ordering.
%
  unique_num = 0;
  hi = 0;

  while ( hi < n )
%
%  Advance LO.
%
    lo = hi + 1;
%
%  Extend HI.
%
    hi = lo;

    while ( hi < n )
      if ( r(indx(hi+1)) == r(indx(lo)) )
        hi = hi + 1;
      else
        break;
      end
    end
%
%  Points INDX(LO) through INDX(HI) have same R value.
%
%  Find the unique ones.
%
    unique_num = unique_num + 1;

    for j1 = lo + 1 : hi
      unique = 1;
      for j2 = lo : j1 - 1
        if ( all ( a(1:m,indx(j2)) == a(1:m,indx(j1)) ) )
          unique = 0;
          break
        end
      end
      if ( unique )
        unique_num = unique_num + 1;
      end
    end

  end

  return
end
