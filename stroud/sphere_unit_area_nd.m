function value = sphere_unit_area_nd ( n )

%*****************************************************************************80
%
%% SPHERE_UNIT_AREA_ND computes the surface area of a unit sphere in ND.
%
%  Integration region:
%
%    Points X(1:N) such that:
%
%      Sum ( X(1:N) - XC(1:N) )**2 = R**2.
%
%  Discussion:
%
%    N   Area
%
%    2   2       * PI
%    3   4       * PI
%    4   2       * PI**2
%    5   (8/3)   * PI**2
%    6             PI**3
%    7   (16/15) * PI**3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Output, real SPHERE_UNIT_AREA_ND, the area of the sphere.
%
  if ( mod ( n, 2 ) == 0 )
    m = floor ( n / 2 );
    area = 2.0E+00 * pi^m;
    for i = 1 : m-1
      area = area / i;
    end
  else
    m = floor ( ( n - 1 ) / 2 );
    area = 2.0E+00^n * pi^m;
    for i = m+1 : 2*m
      area = area / i;
    end
  end

  value = area;

  return
end
