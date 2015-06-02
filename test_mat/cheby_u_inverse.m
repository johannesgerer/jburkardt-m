function a = cheby_u_inverse ( n )

%*****************************************************************************80
%
%% CHEBY_U_INVERSE returns the inverse of the CHEBY_U matrix.
%
%  Example:
%
%    N = 11
%
%      1   .   .  .   .  .  .  .  .  .  .
%      .   1   .  .   .  .  .  .  .  .  .  /    2
%      1   .   1  .   .  .  .  .  .  .  .  /    4
%      .   2   .  1   .  .  .  .  .  .  .  /    8
%      2   .   3  .   1  .  .  .  .  .  .  /   16
%      .   5   .  4   .  1  .  .  .  .  .  /   32
%      5   .   9  .   5  .  1  .  .  .  .  /   64
%      .  14   . 14   .  6  .  1  .  .  .  /  128
%     14   .  28  .  20  .  7  .  1  .  .  /  256
%      .  42   . 48   . 27  .  8  .  1  .  /  512
%     42   .  90  .  75  . 35  .  9  .  1  / 1024
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 0.5;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) =                      a(i-1,j+1)   / 2.0;
      elseif ( j < n )
        a(i,j) = (       a(i-1,j-1) + a(i-1,j+1) ) / 2.0;
      else
        a(i,j) =         a(i-1,j-1)                / 2.0;
      end
    end
  end

  return
end
