function [ xc, rank, seed ] = comp_random_grlex ( kc, rank1, rank2, seed )

%*****************************************************************************80
%
%% COMP_RANDOM_GRLEX randomly selects a composition in a given rank range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer KC, the number of parts of the composition.
%    1 <= KC.
%
%    Input, integer RANK1, RANK2, the lowest and highest ranks to consider.
%    1 <= RANK1 <= RANK2.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, integer XC(KC), a randomly chosen composition with rank
%    between RANK1 and RANK2.
%
%    Output, integer RANK, the rank of the composition.
%

%
%  Ensure that 1 <= KC.
%
  if ( kc < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_RANDOM_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  KC < 1\n' );
    error ( 'COMP_RANDOM_GRLEX - Fatal error!' );
  end
%
%  Ensure that 1 <= RANK1.
%
  if ( rank1 < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_RANDOM_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  RANK1 < 1\n' );
    error ( 'COMP_RANDOM_GRLEX - Fatal error!' );
  end
%
%  Ensure that RANK1 <= RANK2.
%
  if ( rank2 < rank1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMP_RANDOM_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  RANK2 < RANK1\n' );
    error ( 'COMP_RANDOM_GRLEX - Fatal error!' );
  end
%
%  Select the rank.
%
  [ rank, seed ] = i4_uniform_ab ( rank1, rank2, seed );
%
%  Recover the composition.
%
  xc = comp_unrank_grlex ( kc, rank );

  return
end

