function [ x, seed ] = circular_normal_sample ( a, b, seed )

%*****************************************************************************80
%
%% CIRCULAR_NORMAL_SAMPLE samples the Circular Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), a parameter of the PDF, the mean value.
%
%    Input, real B, a parameter of the PDF, the standard deviation.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real X(2), a sample of the PDF.
%
  [ v1, seed ] = r8_uniform_01 ( seed );
  [ v2, seed ] = r8_uniform_01 ( seed );

  r = sqrt ( - 2.0 * log ( v1 ) );

  x(1) = a(1) + b * r * cos ( 2.0 * pi * v2 );
  x(2) = a(2) + b * r * sin ( 2.0 * pi * v2 );

  return
end
