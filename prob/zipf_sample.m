function [ x, seed ] = zipf_sample ( a, seed )

%*****************************************************************************80
%
%% ZIPF_SAMPLE samples the Zipf PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Luc Devroye,
%    Non-Uniform Random Variate Generation,
%    Springer Verlag, 1986, pages 550-551.
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  b = 2.0^( a - 1.0 );

  while ( 1 )

    [ u, seed ] = r8_uniform_01 ( seed );
    [ v, seed ] = r8_uniform_01 ( seed );
    w = floor ( 1.0 / u^( 1.0 / ( a - 1.0 ) ) );

    t = ( ( w + 1.0 ) / w )^( a - 1.0 );

    if ( v * w * ( t - 1.0 ) * b <= t * ( b - 1.0 ) )
      break
    end

  end

  x = floor ( w );

  return
end
