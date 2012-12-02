function a = i3mat_flip_rows ( m, n, a )

%*****************************************************************************80
%
%% I3MAT_FLIP_ROWS swaps the rows of an I3MAT.
%
%  Discussion:
%
%    An I3MAT is a matrix, each of whose entries is an I3, a triple of integers.
%
%    An I3MAT can be stored as a 3 x M x N array, where M counts the "columns"
%    and N counts the "rows".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(3,M,N), the matrix whose rows are to be flipped.
%
%    Output, integer A(3,M,N), the matrix whose rows have been flipped.
%
  for i = 1 : floor ( m / 2 )
    b(1:3,    1,1:n) = a(1:3,    i,1:n);
    a(1:3,    i,1:n) = a(1:3,m+1-i,1:n);
    a(1:3,m+1-i,1:n) = b(1:3,    1,1:n);
  end

  return
end
