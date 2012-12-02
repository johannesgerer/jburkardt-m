function a = cheby_t_inverse ( n )

%*****************************************************************************80
%
%% CHEBY_T_INVERSE returns the inverse of the Chebyshev T matrix.
%
%
%  Example:
%
%    N = 11
%
%      1   .   .  .   .  .  .  .  .  .  .
%      .   1   .  .   .  .  .  .  .  .  .
%      1   .   1  .   .  .  .  .  .  .  .  /   2
%      .   3   .  1   .  .  .  .  .  .  .  /   4
%      3   .   4  .   1  .  .  .  .  .  .  /   8
%      .  10   .  5   .  1  .  .  .  .  .  /  16
%     10   .  15  .   6  .  1  .  .  .  .  /  32
%      .  35   . 21   .  7  .  1  .  .  .  /  64
%     35   .  56  .  28  .  8  .  1  .  .  / 128
%      . 126   . 84   . 36  .  9  .  1  .  / 256
%    126   . 210  . 120  . 45  . 10  .  1  / 512
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 20007
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
  if ( n <= 0 )
    return
  end

  a(1:n,1:n) = 0.0;

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 1.0;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) =                      a(i-1,j+1)   / 2.0;
      elseif ( j == 2 )
        a(i,j) = ( 2.0 * a(i-1,j-1) + a(i-1,j+1) ) / 2.0;
      elseif ( j < n )
        a(i,j) = (       a(i-1,j-1) + a(i-1,j+1) ) / 2.0;
      else
        a(i,j) =         a(i-1,j-1)                / 2.0;
      end
    end
  end

  return
end
