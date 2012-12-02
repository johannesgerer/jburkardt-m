function inside = sphere_imp_contains_point_3d ( r, center, p )

%*****************************************************************************80
%
%% SPHERE_IMP_CONTAINS_POINT_3D: point in implicit sphere in 3D?
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - CENTER(1:DIM_NUM) )**2 ) = R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2005
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
%    Input, real P(3), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if the point is inside the sphere.
%
  dim_num = 3;
  
  if ( sum ( ( p(1:dim_num) - center(1:dim_num) ).^2 ) <= r * r )
    inside = 1;
  else
    inside = 0;
  end

  return
end
