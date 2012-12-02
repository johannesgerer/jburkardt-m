function [ x, seed ] = sphere_unit_sample2_nd ( dim_num, seed )

%*****************************************************************************80
%
%% SPHERE_UNIT_SAMPLE2_ND picks a random point on the unit sphere in ND.
%
%  Discussion:
%
%    The unit sphere in ND satisfies:
%
%      sum ( 1 <= I <= DIM_NUM ) X(I) * X(I) = 1
%
%    DIM_NUM independent normally distributed random numbers are generated,
%    and then scaled to have unit norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
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
  [ x, seed ] = r8vec_normal_01 ( dim_num, seed );

  norm = sqrt ( sum ( x(1:dim_num).^2 ) );

  x(1:dim_num) = x(1:dim_num) / norm;

  return
end
