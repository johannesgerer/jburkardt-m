function [ x, seed ] = cube01_sample ( n, seed )

%*****************************************************************************80
%
%% CUBE01_SAMPLE samples points in the unit cube in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(3,N), the points.
%
  m = 3;

  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );

  return
end
