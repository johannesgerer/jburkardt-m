function [ a, seed ] = r8_uniform ( b, c, seed )

%*****************************************************************************80
%
%% R8_UNIFORM returns a scaled pseudorandom R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, double precision B, C, the minimum and maximum values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, double precision A, the randomly chosen value.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM - Fatal error!' );
  end
%
%  Pick T, a random number in (0,1).
%
  [ t, seed ] = r8_uniform_01 ( seed );
%
%  Set A in ( B, C ).
%
  a = ( 1.0 - t ) * b + t * c;

  return
end
