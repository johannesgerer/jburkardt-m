function [ x, seed ] = c_normal_01_sample ( seed )

%*****************************************************************************80
%
%% C_NORMAL_01_SAMPLE samples the complex Normal 01 PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, complex X, a sample of the PDF.
%
  [ v1, seed ] = r8_uniform_01 ( seed );
  [ v2, seed ] = r8_uniform_01 ( seed );

  x_r = sqrt ( - 2.0 * log ( v1 ) ) * cos ( 2.0 * pi * v2 );
  x_c = sqrt ( - 2.0 * log ( v1 ) ) * sin ( 2.0 * pi * v2 );

  x = x_r + i * x_c;

  return
end
