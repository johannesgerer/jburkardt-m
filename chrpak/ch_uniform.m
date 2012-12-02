function [ ch, seed ] = ch_uniform ( clo, chi, seed )

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
%    23 April 2011
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
%    Output, character CH, the randomly chosen character.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ t, seed ] = r8_uniform_01 ( seed );

  ch = floor ( clo + t * ( chi + 1 - clo ) );

  ch = max ( ch, clo );
  ch = min ( ch, chi );
  ch = char ( ch );

  return
end
