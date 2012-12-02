function variance = arcsin_variance ( a )

%*****************************************************************************80
%
%% ARCSIN_VARIANCE returns the variance of the Arcsin PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the CDF.
%    A must be positive.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = a * a / 2.0;

  return
end
