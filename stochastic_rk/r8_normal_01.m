function [ x, seed ] = r8_normal_01 ( seed )

%*****************************************************************************80
%
%% R8_NORMAL_01 returns a unit pseudonormal R8.
%
%  Discussion:
%
%    The standard normal probability distribution function (PDF) has
%    mean 0 and standard deviation 1.
%
%    Because this routine uses the Box Muller method, it requires pairs
%    of uniform random values to generate a pair of normal random values.
%    This means that on every other call, the code can use the second
%    value that it calculated.
%
%    However, if the user has changed the SEED value between calls,
%    the routine automatically resets itself and discards the saved data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  persistent seed1;
  persistent seed2;
  persistent seed3;
  persistent used;
  persistent v2;

  if ( size ( used ) == 0 )
    used = 0;
    seed1 = 0;
    seed2 = 0;
    seed3 = 0;
    v2 = 0.0;
  end
%
%  If USED is odd, but the input SEED does not match
%  the output SEED on the previous call, then the user has changed
%  the seed.  Wipe out internal memory.
%
  if ( mod ( used, 2 ) == 1 )

    if ( seed ~= seed2 )
      used = 0;
      seed1 = 0;
      seed2 = 0;
      seed3 = 0;
      v2 = 0.0;
    end

  end
%
%  If USED is even, generate two uniforms, create two normals,
%  return the first normal and its corresponding seed.
%
  if ( mod ( used, 2 ) == 0 )

    seed1 = seed;

    [ r1, seed ] = r8_uniform_01 ( seed );

    if ( r1 == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_NORMAL_01 - Fatal error!\n' );
      fprintf ( 1, '  R8_UNIFORM_01 returned a value of 0.\n' );
      error ( 'R8_NORMAL_01 - Fatal error!\n' );
    end

    seed2 = seed;

    [ r2, seed ] = r8_uniform_01 ( seed );

    seed3 = seed;

    v1 = sqrt ( -2.0 * log ( r1 ) ) * cos ( 2.0 * pi * r2 );
    v2 = sqrt ( -2.0 * log ( r1 ) ) * sin ( 2.0 * pi * r2 );

    x = v1;
    seed = seed2;
%
%  If USED is odd (and the input SEED matched the output value from
%  the previous call), return the second normal and its corresponding seed.
%
  else

    x = v2;
    seed = seed3;

  end

  used = used + 1;

  return
end
