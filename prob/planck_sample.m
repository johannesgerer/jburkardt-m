function [ x, seed ] = planck_sample ( a, b, seed )

%*****************************************************************************80
%
%% PLANCK_SAMPLE samples the Planck PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Luc Devroye,
%    Non-Uniform Random Variate Generation,
%    Springer Verlag, 1986, pages 552.
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
  a2 = 0.0;
  b2 = 1.0;
  c2 = b + 1.0;

  [ g, seed ] = gamma_sample ( a2, b2, c2, seed );

  [ z, seed ] = zipf_sample ( c2, seed );

  x = g / ( a * z );

  return
end
