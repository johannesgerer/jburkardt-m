function [ a, unique_num] = r8col_sorted_tol_unique ( m, n, a, tol )

%*****************************************************************************80
%
%% R8COL_SORTED_TOL_UNIQUE keeps tolerably unique elements in an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the sorted array of N columns of M-vectors.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, real A(M,UNIQUE_NUM), a sorted array of UNIQUE_NUM columns of M-vectors.
%
%    Output, integer UNIQUE_NUM, the number of unique columns.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;
  
  for i = 2 : n

    unique = 1;

    for j = 1 : unique_num
      if ( max ( abs ( a(1:m,j) - a(1:m,i) ) ) <= tol )
        unique = 0;
        break
      end
    end

    if ( unique )
      unique_num = unique_num + 1;
      a(1:m,unique_num) = a(1:m,i);
    end

  end

  a = a(1:m,1:unique_num);

  return
end
