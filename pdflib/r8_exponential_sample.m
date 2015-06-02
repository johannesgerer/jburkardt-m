function value = r8_exponential_sample ( lambda )

%*****************************************************************************80
%
%% R8_EXPONENTIAL_SAMPLE samples the exponential PDF.
%
%  Discussion:
%
%    Note that the parameter LAMBDA is a multiplier.  In some formulations,
%    it is used as a divisor instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real LAMBDA, the parameter of the PDF.
%
%    Output, real VALUE, a sample of the PDF.
%
  r = r8_uniform_01_sample ( );

  value = - log ( r ) * lambda;

  return
end