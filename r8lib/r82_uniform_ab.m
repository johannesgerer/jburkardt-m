function [ a, seed ] = r82_uniform_ab ( b, c, seed )

%*****************************************************************************80
%
%% R82_UNIFORM_AB returns a random R82 in a given range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real B, C, the minimum and maximum values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(2), the randomly chosen values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ t(1:2), seed ] = r8vec_uniform_01 ( 2, seed );

  a(1:2) = ( 1.0 - t(1:2) ) * b + t(1:2) * c;

  return
end
