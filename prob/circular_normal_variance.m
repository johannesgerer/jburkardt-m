function variance = circular_normal_variance ( a, b )

%*****************************************************************************80
%
%% CIRCULAR_NORMAL_VARIANCE returns the variance of the Circular Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), a parameter of the PDF, the mean value.
%
%    Input, real B, a parameter of the PDF, the standard deviation.
%
%    Output, real VARIANCE(2), the variance of the PDF.
%
  variance(1) = b^2;
  variance(2) = b^2;

  return
end
