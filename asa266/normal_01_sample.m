function [ x, seed ] = normal_01_sample ( seed )

%*****************************************************************************80
%
%% NORMAL_01_SAMPLE samples the standard normal probability distribution.
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
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, X, a sample of the standard normal PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  persistent used;
  persistent y;

  if ( size ( used ) == 0 )
    used = 0;
    y = 0;
  end
%
%  If we've used an even number of values so far, generate two more,
%  return one and save one.
%
  if ( mod ( used, 2 ) == 0 )

    while ( 1 )

      [ r1, seed ] = r8_uniform_01 ( seed );

      if ( r1 ~= 0.0 )
        break
      end

    end

    [ r2, seed ] = r8_uniform_01 ( seed );

    x = sqrt ( -2.0 * log ( r1 ) ) * cos ( 2.0 * pi * r2 );
    y = sqrt ( -2.0 * log ( r1 ) ) * sin ( 2.0 * pi * r2 );
%
%  Otherwise, return the second, saved, value.
%
  else

    x = y;

  end

  used = used + 1;

  return
end
