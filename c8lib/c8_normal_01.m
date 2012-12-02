function [ z, seed ] = c8_normal_01 ( seed )

%*****************************************************************************80
%
%% C8_NORMAL_01 returns a unit normally distributed complex number.
%
%  Discussion:
%
%    The value has mean 0 and standard deviation 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, complex Z, a sample of the PDF.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ v1, seed ] = r8_uniform_01 ( seed );
  [ v2, seed ] = r8_uniform_01 ( seed );

  x_r = sqrt ( - 2.0 * log ( v1 ) ) * cos ( 2.0 * pi * v2 );
  x_c = sqrt ( - 2.0 * log ( v1 ) ) * sin ( 2.0 * pi * v2 );

  z = x_r + x_c * i;

  return
end
