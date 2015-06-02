function value = pyramid_square_num ( n )

%*****************************************************************************80
%
%% PYRAMID_SQUARE_NUM returns the N-th pyramidal square number.
%
%  Discussion:
%
%    The N-th pyramidal square number PS(N) is formed by the sum of the first
%    N squares S:
%
%      S(I) = I^2
%
%      PS(N) = sum ( 1 <= I <= N ) S(I)
%
%    By convention, PS(0) = 0.
%
%    The formula is:
%
%      PS(N) = ( N * ( N + 1 ) * ( 2*N+1 ) ) / 6
%
%    Note that geometrically, this pyramid will have a square base.
%
%  Example:
%
%    0    0
%    1    1
%    2    5
%    3   14
%    4   30
%    5   55
%    6   91
%    7  140
%    8  204
%    9  285
%   10  385
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer  N, the index.
%    0 <= N.
%
%    Output, integer PYRAMID_SQUARE_NUM, the N-th 
%    pyramid square number.
%
  value = ( n * ( n + 1 ) * ( 2 * n + 1 ) ) / 6;

  return
end
