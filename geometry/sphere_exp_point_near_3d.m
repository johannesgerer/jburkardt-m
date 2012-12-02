function pn = sphere_exp_point_near_3d ( p1, p2, p3, p4, p )

%*****************************************************************************80
%
%% SPHERE_EXP_POINT_NEAR_3D finds the nearest point on an explicit sphere to a point in 3D.
%
%  Discussion:
%
%    An explicit sphere in 3D is determined by four points,
%    which should be distinct, and not coplanar.
%
%    If the center of the sphere is (Xc,Yc,Zc), and the point is (X,Y,Z), then
%    the desired point lies at a positive distance R along the vector 
%    (X-Xc, Y-Yc, Z-Zc) unless (X,Y,Z) = (Xc,Yc,Zc), in which case any 
%    point on the sphere is "nearest".
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
%    Input, real P1(3), P2(3), P3(3), P4(3),
%    four distinct noncoplanar points on the sphere.
%
%    Input, real P(3), a point whose nearest point on the 
%    sphere is desired.
%
%    Output, real PN(3), the nearest point on the sphere.
%
  dim_num = 3;
%
%  Find the center.
%
  [ r, center ] = sphere_exp2imp_3d ( p1, p2, p3, p4 );
%
%  If P = CENTER, bail out now.
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
