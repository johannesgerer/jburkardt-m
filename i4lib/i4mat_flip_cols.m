function a = i4mat_flip_cols ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_FLIP_COLS swaps the columns of an I4MAT.
%
%  Discussion:
%
%    An I4MAT is an integer matrix.
%
%    To "flip" the columns of an IMAT is to start with something like
%
%      11 12 13 14 15
%      21 22 23 24 25
%      31 32 33 34 35
%      41 42 43 44 45
%      51 52 53 54 55
%
%    and return
%
%      15 14 13 12 11
%      25 24 23 22 21
%      35 34 33 32 31
%      45 44 43 42 41
%      55 54 53 52 51
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
%    Input, integer A[M,N], the matrix whose columns are to be flipped.
%
%    Output, integer A[M,N], the flipped matrix.
%
  for j = 1 : floor ( n / 2 )
    b(1:m,    1) = a(1:m,    j);
    a(1:m,    j) = a(1:m,n+1-j);
    a(1:m,n+1-j) = b(1:m,    1);
  end

  return
end
