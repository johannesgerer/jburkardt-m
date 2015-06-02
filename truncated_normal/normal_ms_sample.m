function [ x, seed ] = normal_ms_sample ( mu, sigma, seed )

%*****************************************************************************80
%
%% NORMAL_MS_SAMPLE samples the Normal MS PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real MU, SIGMA, the parameters of the PDF.
%    0.0 < SIGMA.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ y, seed ] = normal_01_sample ( seed );

  x = mu + sigma * y;

  return
end
