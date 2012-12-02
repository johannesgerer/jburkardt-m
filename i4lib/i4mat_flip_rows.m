function a = i4mat_flip_rows ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_FLIP_ROWS swaps the rows of an I4MAT.
%
%  Discussion:
%
%    An I4MAT is an integer matrix.
%
%    To "flip" the rows of an IMAT is to start with something like
%
%      11 12 13 14 15
%      21 22 23 24 25
%      31 32 33 34 35
%      41 42 43 44 45
%      51 52 53 54 55
%
%    and return
%
%      51 52 53 54 55
%      41 42 43 44 45
%      31 32 33 34 35
%      21 22 23 24 25
%      11 12 13 14 15
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
%    Input, integer A[M,N], the matrix whose rows are to be flipped.
%
%    Output, integer A[M,N], the flipped matrix.
%
  for i = 1 : floor ( m / 2 )
    b(1,    1:n) = a(    i,1:n);
    a(    i,1:n) = a(m+1-i,1:n);
    a(m+1-i,1:n) = b(1,    1:n);
  end

  return
end
