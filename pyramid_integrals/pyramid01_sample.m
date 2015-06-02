function [ x, seed ] = pyramid01_sample ( n, seed )

%*****************************************************************************80
%
%% PYRAMID01_SAMPLE: sample the unit pyramid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of samples desired.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(3,N), the sample values.
%
  one_third = 1.0 / 3.0;

  [ x, seed ] = r8mat_uniform_01 ( 3, n, seed );

  x(3,1:n) = 1.0 - x(3,1:n) .^ one_third;
  x(2,1:n) = ( 1.0 - x(3,1:n) ) .* ( 2.0 * x(2,1:n) - 1.0 );
  x(1,1:n) = ( 1.0 - x(3,1:n) ) .* ( 2.0 * x(1,1:n) - 1.0 );

  return
end