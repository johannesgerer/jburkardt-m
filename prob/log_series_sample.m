function [ x, seed ] = log_series_sample ( a, seed )

%*****************************************************************************80
%
%% LOG_SERIES_SAMPLE samples the Logarithmic Series PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Luc Devroye,
%    Non-Uniform Random Variate Generation,
%    Springer-Verlag, New York, 1986, page 547.
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A < 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ u, seed ] = r8_uniform_01 ( seed );
  [ v, seed ] = r8_uniform_01 ( seed );

  x = floor ( 1.0 + log ( v ) / ( log ( 1.0 - ( 1.0 - a )^u ) ) );

  return
end
