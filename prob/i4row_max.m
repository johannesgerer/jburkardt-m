function [ xmax, ixmax ] = i4row_max ( m, n, x )

%*****************************************************************************80
%
%% I4ROW_MAX returns the maximums of rows of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer X(M,N), the array to be examined.
%
%    Output, integer XMAX(M), the maximums of the rows of X.
%
%    Output, integer IXMAX(M); IXMAX(I) is the column of X in which
%    the maximum for row I occurs.
%
  for i = 1 : m

    ixmax(i) = 1;
    xmax(i) = x(i,1);
    for j = 2 : n
      if ( xmax(i) < x(i,j) )
        ixmax(i) = j;
        xmax(i) = x(i,j);
      end
    end

  end

  return
end
