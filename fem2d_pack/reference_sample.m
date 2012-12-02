function [ r, s, seed ] = reference_sample ( code, seed )

%*****************************************************************************80
%
%% REFERENCE_SAMPLE samples a reference element.
%
%  Discussion:
%
%    The routine either samples the unit triangle or the unit square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 'T3', 
%    'T4', 'T6' and 'T10'.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real R, S, a random point in the reference element.
%
%    Output, integer SEED, a seed for the random number generator.
%
  if ( code(1) == 'Q' | code(1) == 'q' )

    [ r, seed ] = r8_uniform_01 ( seed );
    [ s, seed ] = r8_uniform_01 ( seed );

  elseif ( code(1) == 'T' | code(1) == 't' )

    [ r, seed ] = r8_uniform_01 ( seed );
    [ s, seed ] = r8_uniform_01 ( seed );

    if ( 1.0 < r + s )
      r = 1.0 - r;
      s = 1.0 - s;
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'REFERENCE_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal code = "%s".\n', code );

  end

  return
end
