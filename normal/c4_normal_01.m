function [ c, seed ] = c4_normal_01 ( seed )

%*****************************************************************************80
%
%% C4_NORMAL_01 returns a unit pseudonormal C4.
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
%    Output, complex C, a sample of the PDF.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ v1, seed ] = r4_uniform_01 ( seed );
  [ v2, seed ] = r4_uniform_01 ( seed );

  x_r = sqrt ( - 2.0 * log ( v1 ) ) * cos ( 2.0 * pi * v2 );
  x_c = sqrt ( - 2.0 * log ( v1 ) ) * sin ( 2.0 * pi * v2 );

  c = x_r + x_c * i;

  return
end
