function b = r8col_normalize_li ( m, n, a )

%*****************************************************************************80
%
%% R8COL_NORMALIZE_LI normalizes an R8COL with the column infinity norm.
%
%  Discussion:
%
%    Each column is scaled so that the entry of maximum norm has the value 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the array to be examined.
%
%    Output, real B(M,N), the normalize array.
%
  b(1:m,1:n) = a(1:m,1:n);

  for j = 1 : n
    c = a(1,j);
    for i = 2 : m
      if ( abs ( c ) < abs ( a(i,j) ) ) 
        c = a(i,j);
      end
    end
    if ( c ~= 0.0 )
      b(1:m,j) = b(1:m,j) / c;
    end
  end

  return
end
