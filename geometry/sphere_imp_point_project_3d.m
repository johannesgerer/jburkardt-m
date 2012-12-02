function pp = sphere_imp_point_project_3d ( r, center, p )

%*****************************************************************************80
%
%% SPHERE_IMP_POINT_PROJECT_3D projects a point onto an implicit sphere in 3D.
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
%    23 February 2005
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
%    Input, real P(3), a point.
%
%    Output, real PP(3), the projected point.
%
  dim_num = 3;

  if ( r == 0.0 )

    pp(1:dim_num) = center(1:dim_num);

  elseif ( p(1:dim_num) == center(1:dim_num) )

    pp(1:dim_num) = center(1:dim_num) + r / sqrt ( dim_num );

  else

    norm = sqrt ( sum ( ( p(1:dim_num) - center(1:dim_num) ).^2 ) );
 
    pp(1:dim_num) = center(1:dim_num) + r * ( p(1:dim_num) - center(1:dim_num) ) / norm;

  end

  return
end
