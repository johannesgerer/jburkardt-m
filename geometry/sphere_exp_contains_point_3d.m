function inside = sphere_exp_contains_point_3d ( p1, p2, p3, p4, p )

%*****************************************************************************80
%
%% SPHERE_EXP_CONTAINS_POINT_3D determines if an explicit sphere contains a point in 3D.
%
%  Discussion:
%
%    An explicit sphere in 3D is determined by four points,
%    which should be distinct, and not coplanar.
%
%    The computation checks the determinant of the 5 by 5 matrix:
%
%      x1  y1  z1  x1**2+y1**2+z1**2  1
%      x2  y2  z2  x2**2+y2**2+z2**2  1
%      x3  y3  z3  x3**2+y3**2+z3**2  1
%      x4  y4  z4  x4**2+y4**2+z4**2  1
%      x   y   z   x**2 +y**2 +z**2   1
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
%    Input, real P(3), the coordinates of a point, whose
%    position relative to the sphere is desired.
%
%    Output, logical INSIDE, is TRUE if the point is in the sphere.
%
  dim_num = 3;
%
%  Compute the determinant.
%
  a(1,1:dim_num) = p1(1:dim_num);
  a(1,4) = sum ( p1(1:dim_num).^2 );
  a(1,5) = 1.0;

  a(2,1:dim_num) = p2(1:dim_num);
  a(2,4) = sum ( p2(1:dim_num).^2 );
  a(2,5) = 1.0;

  a(3,1:dim_num) = p3(1:dim_num);
  a(3,4) = sum ( p3(1:dim_num).^2 );
  a(3,5) = 1.0;

  a(4,1:dim_num) = p4(1:dim_num);
  a(4,4) = sum ( p4(1:dim_num).^2 );
  a(4,5) = 1.0;

  a(5,1:dim_num) = p(1:dim_num);
  a(5,4) = sum ( p(1:dim_num).^2 );
  a(5,5) = 1.0;

  det = r8mat_det_5d ( a );

  if ( det < 0.0 )
    inside = 0;
  elseif ( 0.0 <= det )
    inside = 1;
  end

  return
end
