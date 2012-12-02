function variance = rayleigh_variance ( a )

%*****************************************************************************80
%
%% RAYLEIGH_VARIANCE returns the variance of the Rayleigh PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameters of the PDF.
%    0.0 < A.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = 2.0 * a * a * ( 1.0 - 0.25 * pi );

  return
end
