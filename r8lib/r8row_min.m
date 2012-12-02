function [ xmin, ixmin ] = r8row_min ( m, n, x )

%*****************************************************************************80
%
%% R8ROW_MIN returns the minimums of rows of an R8ROW.
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
%    Output, real XMIN(M), the minimums of the rows of X.
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
