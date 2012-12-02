function [ c, seed ] = ch_uniform ( clo, chi, seed )

%*****************************************************************************80
%
%% CH_UNIFORM returns a random character in a given range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CLO, CHI, the minimum and maximum acceptable characters.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, character C, the randomly chosen character.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ d, seed ] = r8_uniform_01 ( seed );

  c = round ( ( 1.0 - d ) * clo + d * chi );

  return
end
