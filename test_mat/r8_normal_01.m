function [ x, seed ] = r8_normal_01 ( seed )

%*****************************************************************************80
%
%% R8_NORMAL_01 samples the standard normal probability distribution.
%
%  Discussion:
%
%    The standard normal probability distribution function (PDF) has
%    mean 0 and standard deviation 1.
%
%  Method:
%
%    The Box-Muller method is used, which is efficient, but
%    generates two values at a time.
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
%    Output, real X, a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  persistent seed2;
  persistent used;
  persistent y;

  if ( size ( used ) == 0 )
    used = 0;
    seed2 = 0;
    y = 0;
  end
%
%  If we've used an even number of values so far, generate two more,
%  return one and save one.
%
  if ( mod ( used, 2 ) == 0 )

    [ r1, seed ] = r8_uniform_01 ( seed );

    if ( r1 == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_NORMAL_01 - Fatal error!\n' );
      fprintf ( 1, '  R8_UNIFORM_01 returned a value of 0.\n' );
      error ( 'R8_NORMAL_01 - Fatal error!\n' );
    end

    seed2 = seed;
    [ r2, seed2 ] = r8_uniform_01 ( seed2 );

    x = sqrt ( -2.0 * log ( r1 ) ) * cos ( 2.0 * pi * r2 );
    y = sqrt ( -2.0 * log ( r1 ) ) * sin ( 2.0 * pi * r2 );
%
%  Otherwise, return the second, saved, value, and the corresponding value of SEED.
%
  else

    x = y;
    seed = seed2;

  end

  used = used + 1;

  return
end
