function [ x, seed ] = line01_sample ( n, seed )

%*****************************************************************************80
%
%% LINE01_SAMPLE samples the unit line in 1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 January 2014
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
%    Output, real X(N), the points.
%
  [ x, seed ] = r8vec_uniform_01 ( n, seed );

  return
end
