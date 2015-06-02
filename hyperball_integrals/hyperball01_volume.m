function volume = hyperball01_volume ( m )

%*****************************************************************************80
%
%% HYPERBALL01_VOLUME returns the volume of the unit hyperball in M dimensions.
%
%  Discussion:
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real VOLUME, the volume of the unit ball.
%
  if ( mod ( m, 2 ) == 0 )
    m_half = floor ( m / 2 );
    volume = pi ^ m_half;
    for i = 1 : m_half
      volume = volume / i;
    end
  else
    m_half = floor ( ( m - 1 ) / 2 );
    volume = pi ^ m_half * 2.0 ^ m;
    for i = m_half + 1 : 2 * m_half + 1
      volume = volume / i;
    end
  end

  return
end
