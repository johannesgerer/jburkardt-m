function [ x, seed ] = brownian ( dim_num, n, seed )

%*****************************************************************************80
%
%% BROWNIAN creates Brownian motion points.
%
%  Discussion:
%
%    A starting point is generated at the origin.  The next point
%    is generated at a uniformly random angle and a (0,1) normally
%    distributed distance from the previous point.
%
%    It is up to the user to rescale the data, if desired.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(DIM_NUM,N), the points.
%

%
%  Initial point.
%
  x(1:dim_num,1) = 0.0;
%
%  Generate angles and steps.
%
  for j = 2 : n

    [ r, seed ] = r8_normal_01 ( seed );
    r = abs ( r );

    [ direction, seed ] = direction_uniform_nd ( dim_num, seed );

    x(1:dim_num,j) = x(1:dim_num,j-1) + r * direction(1:dim_num)';

  end

  return
end
