function [ x, seed ] = beta_sample ( a, b, seed )

%*****************************************************************************80
%
%% BETA_SAMPLE samples the Beta PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Kennedy and James Gentle,
%    Algorithm BN,
%    Statistical Computing,
%    Dekker, 1980.
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  mu = ( a - 1.0 ) / ( a + b - 2.0 );
  stdev = 0.5 / sqrt ( a + b - 2.0 );

  while ( 1 )

    [ y, seed ] = normal_01_sample ( seed );

    x = mu + stdev * y;

    if ( x < 0.0 | 1.0 < x )
      continue
    end

    [ u, seed ] = r8_uniform_01 ( seed );

    test =     ( a - 1.0 )     * log (         x   / ( a - 1.0 ) ) ...
             + ( b - 1.0 )     * log ( ( 1.0 - x ) / ( b - 1.0 ) ) ...
             + ( a + b - 2.0 ) * log ( a + b - 2.0 ) + 0.5 * y^2;

    if ( log ( u ) <= test )
      break
    end

  end

  return
end
