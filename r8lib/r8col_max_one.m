function a = r8col_max_one ( m, n, a )

%*****************************************************************************80
%
%% R8COL_MAX_ONE scales the columns of an R8COL for a maximum of one.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the array.
%
%    Output, real A(M,N), the rescaled array.
%
  for j = 1 : m

    i_big = 1;

    for i = 2 : n
      if ( abs ( a(i_big,j) ) < abs ( a(i,j) ) )
        i_big = i;
      end
    end

    if ( a(i_big,j) ~= 0.0 )
      a(1:m,j) = a(1:m,j) / a(i_big,j);
    end

  end

  return
end

