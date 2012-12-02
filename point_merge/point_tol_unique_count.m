function unique_num = point_tol_unique_count ( m, n, a, tol )

%*****************************************************************************80
%
%% POINT_TOL_UNIQUE_COUNT counts the tolerably unique points.
%
%  Discussion:
%
%    The input data is an M x N array A, representing the M-dimensional
%    coordinates of N points.
%
%    This function uses a simple but expensive approach.  The first point
%    is accepted as unique.  Each subsequent point is accepted as unique
%    only if it is at least a tolerance away from all accepted unique points.
%    This means the expected amount of work is O(N^2).
%
%    The output is the number of unique points in the list.
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
%    Input, real TOL, a tolerance.
%
%    Output, integer UNIQUE_NUM, the number of unique points.
%
  unique(1:n) = 1;
  unique_num = n;

  for i = 2 : n

    for j = 1 : i - 1
      if ( unique(j) )
        dist = sqrt ( sum ( ( a(1:m,i) - a(1:m,j) ).^2 ) );
        if ( dist <= tol )
          unique(i) = 0;
          unique_num = unique_num - 1;
          break
        end
      end
    end

  end

  return
end
