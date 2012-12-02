function [ unique_num, xdnu ] = point_tol_unique_index ( m, n, a, tol )

%*****************************************************************************80
%
%% POINT_TOL_UNIQUE_INDEX indexes the tolerably unique points.
%
%  Discussion:
%
%    This routine uses an algorithm that is O(N^2).
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
%    Input, integer M, the dimension of the data values.
%
%    Input, integer N, the number of data values.
%
%    Input, real A(M,N), the data values.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer UNIQUE_NUM, the number of tolerably
%    unique points.
%
%    Output, integer XDNU(N), the index, in A, of the tolerably unique
%    point that "represents" this point.
%
  unique(1:n) = 1;
  for i = 1 : n
    xdnu(i) = i;
  end
  unique_num = n;

  i = 1;
  xdnu(i) = 1;

  for i = 2 : n

    for j = 1 : i - 1
      if ( unique(j) )
        dist = sqrt ( sum ( ( a(1:m,i) - a(1:m,j) ).^2 ) );
        if ( dist <= tol )
          unique(i) = 0;
          unique_num = unique_num - 1;
          xdnu(i) = j;
          break
        end
      end
    end

  end

  return
end
