function [ imax, amax ] = r8col_max ( m, n, a )

%*****************************************************************************80
%
%% R8COL_MAX returns the column maximums of an R8COL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
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
%    Output, integer IMAX(N); IMAX(I) is the row of A in which
%    the maximum for column I occurs.
%
%    Output, real AMAX(N), the maximums of the columns.
%
  for j = 1 : n

    imax(j) = 1;
    amax(j) = a(1,j);
    for i = 2 : m
      if ( amax(j) < a(i,j) )
        imax(j) = i;
        amax(j) = a(i,j);
      end
    end

  end

  return
end
