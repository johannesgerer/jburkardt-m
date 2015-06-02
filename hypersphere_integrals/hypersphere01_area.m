function area = hypersphere01_area ( m )

%*****************************************************************************80
%
%% HYPERSPHERE01_AREA returns the surface area of the unit hypersphere.
%
%  Discussion:
%
%     M   Area
%
%     2    2        * PI
%     3    4        * PI
%     4  ( 2 /   1) * PI^2
%     5  ( 8 /   3) * PI^2
%     6  ( 1 /   1) * PI^3
%     7  (16 /  15) * PI^3
%     8  ( 1 /   3) * PI^4
%     9  (32 / 105) * PI^4
%    10  ( 1 /  12) * PI^5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real AREA, the area of 
%    the unit hypersphere.
%
  if ( mod ( m, 2 ) == 0 )
    m_half = floor ( m / 2 );
    area = 2.0 * pi ^ m_half;
    for i = 1 : m_half - 1
      area = area / i;
    end
  else
    m_half = floor ( ( m - 1 ) / 2 );
    area = pi ^ m_half * 2.0 ^ m;
    for i = m_half + 1 : 2 * m_half
      area = area / i;
    end
  end

  return
end
