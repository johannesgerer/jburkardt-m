function [ ch, seed ] = ch_uniform_ab ( a, b, seed )

%*****************************************************************************80
%
%% CH_UNIFORM_AB returns a scaled pseudorandom CH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character A, B, the minimum and maximum acceptable characters.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, character CH, the randomly chosen character.
%
%    Output, integer SEED, a seed for the random number generator.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CH_UNIFORM_AB - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'CH_UNIFORM_AB - Fatal error!' );
  end

  [ t, seed ] = r8_uniform_01 ( seed );

  ch = floor ( a + t * ( b + 1 - a ) );

  ch = max ( ch, a );
  ch = min ( ch, b );

  return
end

