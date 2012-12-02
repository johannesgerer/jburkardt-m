function [ a, unique_num] = r8col_sorted_unique ( m, n, a )

%*****************************************************************************80
%
%% R8COL_SORTED_UNIQUE keeps unique elements in an R8COL.
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

  j1 = 1;

  for j2 = 2 : n

    if ( any ( a(1:m,j1) ~= a(1:m,j2) ) )
      j1 = j1 + 1;
      a(1:m,j1) = a(1:m,j2);
    end

  end

  unique_num = j1;
  a = a(1:m,1:unique_num);

  return
end
