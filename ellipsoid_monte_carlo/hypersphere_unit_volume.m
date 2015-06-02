function volume = hypersphere_unit_volume ( m )

%*****************************************************************************80
%
%% HYPERSPHERE_UNIT_VOLUME: volume of a unit hypersphere in M dimensions.
%
%  Discussion:
%
%    The unit sphere in ND satisfies:
%
%      sum ( 1 <= I <= M ) X(I) * X(I) = 1
%
%    Results for the first few values of M are:
%
%     M  Volume
%
%     1    2
%     2    1        * PI
%     3  ( 4 /   3) * PI
%     4  ( 1 /   2) * PI^2
%     5  ( 8 /  15) * PI^2
%     6  ( 1 /   6) * PI^3
%     7  (16 / 105) * PI^3
%     8  ( 1 /  24) * PI^4
%     9  (32 / 945) * PI^4
%    10  ( 1 / 120) * PI^5
%
%    For the unit sphere, Volume(M) = 2 * PI * Volume(M-2) / M
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of the space.
%
%    Output, real VOLUME, the volume of the sphere.
%
  if ( mod ( m, 2 ) == 0 )
    m2 = m / 2;
    volume = pi ^ m2;
    for i = 1 : m2
      volume = volume / i;
    end
  else
    m2 = ( m - 1 ) / 2;
    volume = pi^m2 * 2.0 ^ m;
    for i = m2+1 : 2*m2+1
      volume = volume / i;
    end
  end

  return
end