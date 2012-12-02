function [ xmin, ixmin ] = i4row_min ( m, n, x )

%*****************************************************************************80
%
%% I4ROW_MIN returns the minimums of rows of an I4ROW.
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
%    Output, integer XMIN(M), the minimums of the rows of X.
%
%    Output, integer IXMIN(M); IXMIN(I) is the column of X in which
%    the minimum for row I occurs.
%
  for i = 1 : m

    ixmin(i) = 1;
    xmin(i) = x(i,1);
    for j = 2 : n
      if ( x(i,j) < xmin(i) )
        ixmin(i) = j;
        xmin(i) = x(i,j);
      end
    end

  end

  return
end
