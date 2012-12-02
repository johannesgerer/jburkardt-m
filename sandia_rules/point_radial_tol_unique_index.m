function [ unique_num, undx, xdnu, seed ] = point_radial_tol_unique_index ( ...
  m, n, a, tol, seed )

%*****************************************************************************80
%
%% POINT_RADIAL_TOL_UNIQUE_INDEX indexes the tolerably unique points.
%
%  Discussion:
%
%    The input data is an M x N array A, representing the M-dimensional
%    coordinates of N points.
%
%    The output is:
%    * the number of tolerably unique points in the list;
%    * the index, in the list of unique items, of the representatives 
%      of each point;
%    * the index, in A, of the tolerably unique representatives.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2010
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
%    Input, real TOL, a tolerance for equality.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer UNIQUE_NUM, the number of tolerably
%    unique points.
%
%    Output, integer ( kind = 4 ) UNDX(UNIQUE_NUM), the index, in A, of the 
%    tolerably unique points.
%
%    Output, integer ( kind = 4 ) XDNU(N), the index, in UNDX, of the 
%    tolerably unique point that "represents" this point.
%
%    Output, integer SEED, a seed for the random number generator.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end
%
%  Assign a base point Z randomly in the convex hull.
%
  [ w, seed ] = r8vec_uniform_01 ( n, seed );
  w_sum = sum ( w(1:n,1) );
  w(1:n,1) = w(1:n,1) / w_sum;

  z = zeros ( m, 1 );
  for i = 1 : m
    z(i) = a(i,1:n) * w(1:n,1);
  end
%
%  Compute the radial distance R of each point to Z.
%
  r = zeros ( n, 1 );
  for j = 1 : n
    r(j) = sqrt ( sum ( ( a(1:m,j) - z(1:m) ).^2 ) );
  end
%
%  Implicitly sort the R array.
%
  indx = r8vec_sort_heap_index_a ( n, r );
%
%  To determine if a point I is tolerably unique, we only have to check
%  whether it is distinct from all points J such that R(I) <= R(J) <= R(J)+TOL.
%
  unique_num = 0;
  unique(1:n) = 1;

  for i = 1 : n

    if ( unique(indx(i)) )
%
%  Point INDX(I) is unique, in that no earlier point is near it.
%
      unique_num = unique_num + 1;
      xdnu(indx(i)) = unique_num;
      undx(unique_num) = indx(i);
%
%  Look for later points which are close to point INDX(I)
%  in terms of R.
%
      hi = i;

      while ( hi < n )
        if ( r(indx(i)) + tol < r(indx(hi+1)) )
          break
        end
        hi = hi + 1;
      end
%
%  Points INDX(I+1) through INDX(HI) have an R value close to
%  point INDX(I).  Are they truly close to point INDEX(I)?
%
      for j = i + 1 : hi
        if ( unique(indx(j)) )
          dist = sqrt ( sum ( ( a(1:m,indx(i)) - a(1:m,indx(j)) ).^2 ) );
          if ( dist <= tol )
            unique(indx(j)) = 0;
            xdnu(indx(j)) = xdnu(indx(i));
          end
        end
      end

    end

  end

  return
end
