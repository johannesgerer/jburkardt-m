function [ x, seed ] = latin_random ( dim_num, point_num, seed )

%*****************************************************************************80
%
%% LATIN_RANDOM returns points in a Latin Random Square.
%
%  Discussion:
%
%    In each spatial dimension, there will be exactly one
%    point whose coordinate value lies between consecutive
%    values in the list:
%
%      ( 0, 1, 2, ..., point_num ) / point_num
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,POINT_NUM), the points.
%
%    Output, integer SEED, the updated random number seed.
%
  [ x, seed ] = r8mat_uniform_01 ( dim_num, point_num, seed );
%
%  For spatial dimension I,
%    pick a random permutation of 1 to POINT_NUM,
%    force the corresponding I-th components of X to lie in the
%    interval ( PERM(J)-1, PERM(J) ) / POINT_NUM.
%
  for i = 1: dim_num

    [ perm, seed ] = perm_uniform ( point_num, seed );

    for j = 1: point_num
      x(i,j) = ( ( perm(j) - 1 ) + x(i,j) ) / ( point_num );
    end

  end

  return
end
