function [ x, seed ] = frechet_sample ( alpha, seed )

%*****************************************************************************80
%
%% FRECHET_SAMPLE samples the Frechet PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%    It is required that 0.0 < ALPHA.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= 0.0.\n' );
    error ( 'FRECHET_SAMPLE - Fatal error!' );
  end

  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = frechet_cdf_inv ( cdf, alpha );

  return
end
