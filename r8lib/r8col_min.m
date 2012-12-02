function [ amin, imin ] = r8col_min ( m, n, a )

%*****************************************************************************80
%
%% R8COL_MIN returns the column minimums of an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
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
%    Output, real AMIN(N), the minimums of the columns.
%
%    Output, integer IMIN(N); IMIN(I) is the row of A in which
%    the minimum for column I occurs.
%
  for j = 1 : n

    imin(j) = 1;
    amin(j) = a(1,j);
    for i = 2 : m
      if ( a(i,j) < amin(j) )
        imin(j) = i;
        amin(j) = a(i,j);
      end
    end

  end

  return
end
