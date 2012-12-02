function [ x, seed ] = inverse_gaussian_sample ( a, b, seed )

%*****************************************************************************80
%
%% INVERSE_GAUSSIAN_SAMPLE samples the Inverse Gaussian PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
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
  phi = b / a;
  [ z, seed ] = normal_01_sample ( seed );
  y = z * z;

  t = 1.0 + 0.5 * ( y - sqrt ( 4.0 * phi * y + y * y ) ) / phi;
  [ u, seed ] = r8_uniform_01 ( seed );

  if ( u * ( 1.0 + t ) <= 1.0 )
    x = a * t;
  else
    x = a / t;
  end

  return
end
