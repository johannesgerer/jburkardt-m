function value = r8_exponential_01_sample ( )

%*****************************************************************************80
%
%% R8_EXPONENTIAL_01_SAMPLE samples the standard exponential PDF.
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
%    Output, real VALUE, a sample of the PDF.
%
  r = r8_uniform_01_sample ( );

  value = - log ( r );

  return
end