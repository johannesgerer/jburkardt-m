function volume = sphere_volume_nd ( dim_num, r )

%*****************************************************************************80
%
%% SPHERE_VOLUME_ND computes the volume of a sphere in ND.
%
%  Formula:
%
%    A sphere in ND satisfies the equation:
%
%      sum ( ( X(1:N) - XC(1:N) )**2 ) = R**2
%
%    where R is the radius and XC is the center.
%
%  Discussion:
%
%    N  Volume
%
%    2             PI    * R**2
%    3  (4/3)    * PI    * R**3
%    4  (1/2)    * PI**2 * R**4
%    5  (8/15)   * PI**2 * R**5
%    6  (1/6)    * PI**3 * R**6
%    7  (16/105) * PI**3 * R**7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, real R, the radius of the sphere.
%
%    Output, real VOLUME, the volume of the sphere.
%
  if ( mod ( dim_num, 2 ) == 0 )
    m = floor ( dim_num / 2 );
    volume = pi^m;
    for i = 1 : m
      volume = volume / i;
    end
  else
    m = floor ( ( dim_num - 1 ) / 2 );
    volume = pi^m * 2.0^dim_num;
    for i = m+1 : 2*m+1
      volume = volume / i;
    end
  end

  volume = volume * r^dim_num;

  return
end
