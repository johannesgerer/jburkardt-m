function [ x, seed ] = uniform_in_cube01 ( dim_num, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_CUBE01 creates uniform points in the unit hypercube.
%
%  Discussion:
%
%    The unit hypercube is defined as points whose components are between
%    0 and 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 August 2005
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
  [ x, seed ] = r8mat_uniform_01 ( dim_num, n, seed );

  return
end
