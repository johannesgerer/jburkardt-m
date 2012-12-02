function dist_signed = plane_imp_point_dist_signed_3d ( a, b, c, d, p )

%*****************************************************************************80
%
%% PLANE_IMP_POINT_DIST_SIGNED_3D: signed distance ( implicit plane, point) in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Priamos Georgiades,
%    Signed Distance From Point To Plane,
%    Graphics Gems III,
%    Edited by David Kirk,
%   Academic Press, 1992, pages 233-235, T385.G6973.
%
%  Parameters:
%
%    Input, real A, B, C, D, the implicit plane parameters.
%
%    Input, real P(3), the coordinates of the point.
%
%    Output, real DIST_SIGNED, the signed distance from 
%    the point to the plane.
%
  dim_num = 3;

  norm = sqrt ( a * a + b * b + c * c );

  if ( norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_IMP_POINT_DIST_SIGNED_3D - Fatal error!\n' );
    fprintf ( 1, '  The plane normal vector is null.\n' );
    error ( 'PLANE_IMP_POINT_DIST_SIGNED_3D - Fatal error!' );
  end

  dist_signed = - ( a * p(1) + b * p(2) + c * p(3) + d ) / norm;

  if ( d < 0.0 )
    dist_signed = -dist_signed;
  end

  return
end
