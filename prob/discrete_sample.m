function [ x, seed ] = discrete_sample ( a, b, seed )

%*****************************************************************************80
%
%% DISCRETE_SAMPLE samples the Discrete PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of
%    outcomes 1 through A.  Each entry must be nonnegative.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  b_sum = sum ( b(1:a) );

  [ cdf, seed ] = r8_uniform_01 ( seed );

  x = discrete_cdf_inv ( cdf, a, b );

  return
end
