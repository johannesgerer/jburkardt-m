function [ xmax, ixmax ] = r8row_max ( m, n, x )

%*****************************************************************************80
%
%% R8ROW_MAX returns the maximums of rows of an R8ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real X(M,N), the R8ROW.
%
%    Output, real XMAX(M), the maximums of the rows of X.
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
