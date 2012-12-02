function [ x, seed ] = latin_edge ( dim_num, point_num, seed )

%*****************************************************************************80
%
%% LATIN_EDGE returns edge points in a Latin square.
%
%  Discussion:
%
%    In each spatial dimension, there will be exactly one
%    point with the coordinate value
%
%      ( 0, 1, 2, ..., point_num-1 ) / ( point_num - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer dim_num, the spatial dimension.
%
%    Input, integer point_num, the number of points, which should be
%    at least 2!
%
%    Input, integer SEED, a seed for UNIFORM, the random number generator.
%
%    Output, real x(dim_num,point_num), the points.
%
%    Output, integer SEED, the updated random number seed.
%
  base = 1;

  if ( point_num == 1 )

    x(1:dim_num,1) = 0.5;

  else

    for i = 1: dim_num

      [ perm, seed ] = perm_uniform ( point_num, base, seed );

      for j = 1: point_num
        x(i,j) = ( perm(j) - 1 ) / ( point_num - 1 );
      end 

    end

  end

  return
end
