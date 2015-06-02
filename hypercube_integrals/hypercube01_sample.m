function [ x, seed ] = hypercube01_sample ( m, n, seed )

%*****************************************************************************80
%
%% HYPERCUBE01_SAMPLE samples points in the unit hypercube in M dimensions.
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(M,N), the points.
%
  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );

  return
end
