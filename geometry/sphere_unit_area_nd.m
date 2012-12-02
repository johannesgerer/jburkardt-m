function area = sphere_unit_area_nd ( dim_num )

%*****************************************************************************80
%
%% SPHERE_UNIT_AREA_ND computes the surface area of a unit sphere in ND.
%
%  Discussion:
%
%    The unit sphere in ND satisfies:
%
%      sum ( 1 <= I <= DIM_NUM ) X(I) * X(I) = 1
%
%    Results for the first few values of N are:
%
%    DIM_NUM   Area
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
%    For the unit sphere, Area(DIM_NUM) = DIM_NUM * Volume(DIM_NUM)
%
%    Sphere_Unit_Area ( DIM_NUM ) = 2 * PI^(DIM_NUM/2) / Gamma ( DIM_NUM / 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Output, real SPHERE_UNIT_AREA_ND, the area of the sphere.
%
  if ( mod ( dim_num, 2 ) == 0 )
    m = floor ( dim_num / 2 );
    area = 2.0 * pi^m;
    for i = 1 : m-1
      area = area / i;
    end
  else
    m = floor ( ( dim_num - 1 ) / 2 );
    area = pi^m * 2.0^dim_num;
    for i = m+1 : 2*m
      area = area / i;
    end
  end

  return
end
