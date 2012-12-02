function pn = sphere_imp_point_near_3d ( r, center, p )

%*****************************************************************************80
%
%% SPHERE_IMP_POINT_NEAR_3D: nearest point on implicit sphere to a point in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%    If the center of the sphere is (XC,YC,ZC), and the point is (X,Y,Z), then
%    the desired point lies at a positive distance R along the vector 
%    (X-XC, Y-YC, Z-ZC) unless (X,Y,Z) = (XC,YC,ZC), in which case any point 
%    on the sphere is "nearest".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.
%
%    Input, real CENTER(3), the center of the sphere.
%
%    Input, real P(3), a point whose
%    nearest point on the sphere is desired.
%
%    Output, real PN(3), the nearest point on the sphere.
%
  dim_num = 3;
%
%  If (X,Y,Z) = CENTER, bail out now.
%
  norm = sqrt ( sum ( ( p(1:dim_num) - center(1:dim_num) ).^2 ) );

  if ( norm == 0.0 )
    pn(1:dim_num) = center(1:dim_num) + r / sqrt ( dim_num );
    return
  end
%
%  Compute the nearest point.
%
  pn(1:dim_num) = center(1:dim_num) + r * ( p(1:dim_num) - center(1:dim_num) ) / norm;

  return
end
