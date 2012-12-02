function volume = sphere_unit_volume_nd ( dim_num )

%*****************************************************************************80
%
%% SPHERE_UNIT_VOLUME_ND computes the volume of a unit sphere in ND.
%
%  Discussion:
%
%    The unit sphere in ND satisfies:
%
%      sum ( 1 <= I <= DIM_NUM ) X(I) * X(I) = 1
%
%    Results for the first few values of DIM_NUM are:
%
%     DIM_NUM  Volume
%
%     1    2
%     2    1        * PI
%     3  ( 4 /   3) * PI
%     4  ( 1 /   2) * PI**2
%     5  ( 8 /  15) * PI**2
%     6  ( 1 /   6) * PI**3
%     7  (16 / 105) * PI**3
%     8  ( 1 /  24) * PI**4
%     9  (32 / 945) * PI**4
%    10  ( 1 / 120) * PI**5
%
%    For the unit sphere, Volume(DIM_NUM) = 2 * PI * Volume(DIM_NUM-2)/ DIM_NUM
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
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Output, real VOLUME, the volume of the sphere.
%
  if ( mod ( dim_num, 2 ) == 0 )
    m = dim_num / 2;
    volume = pi^m;
    for i = 1 : m
      volume = volume / i;
    end
  else
    m = ( dim_num - 1 ) / 2;
    volume = pi^m * 2.0^dim_num;
    for i = m+1 : 2*m+1
      volume = volume / i;
    end
  end

  return
end
