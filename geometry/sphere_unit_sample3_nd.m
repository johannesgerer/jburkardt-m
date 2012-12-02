function [ x, seed ] = sphere_unit_sample3_nd ( dim_num, seed )

%*****************************************************************************80
%
%% SPHERE_UNIT_SAMPLE3_ND picks a random point on the unit sphere in ND.
%
%  Discussion:
%
%    The unit sphere in ND satisfies:
%
%      sum ( 1 <= I <= DIM_NUM ) X(I) * X(I) = 1
%
%    Points in the [-1,1] cube are generated.  Points lying outside
%    the sphere are rejected.  Points inside the unit sphere are normalized
%    to lie on the sphere.
%
%    Because the volume of the unit sphere
%    relative to the unit cube decreases drastically in higher dimensions,
%    this routine becomes increasingly inefficient at higher DIM_NUM.  
%    Above DIM_NUM = 5, this problem will become significant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM), the random point.
%
%    Output, integer SEED, a seed for the random number generator.
%
  while ( 1 )

    [ x, seed ] = r8vec_uniform_01 ( dim_num, seed );

    x(1:dim_num) = 2.0 * x(1:dim_num) - 1.0;

    norm = sqrt ( sum ( x(1:dim_num).^2 ) );

    if ( norm <= 1.0 )
      x(1:dim_num) = x(1:dim_num) / norm;
      break
    end

  end

  return
end
