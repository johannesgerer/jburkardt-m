function [ x, seed ] = circular_normal_01_sample ( seed )

%*****************************************************************************80
%
%% CIRCULAR_NORMAL_01_SAMPLE samples the Circular Normal 01 PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(2), a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ v1, seed ] = r8_uniform_01 ( seed );
  [ v2, seed ] = r8_uniform_01 ( seed );

  x(1) = sqrt ( -2.0 * log ( v1 ) ) * cos ( 2.0 * pi * v2 );
  x(2) = sqrt ( -2.0 * log ( v1 ) ) * sin ( 2.0 * pi * v2 );

  return
end
