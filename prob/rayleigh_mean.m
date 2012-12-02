function mean = rayleigh_mean ( a )

%*****************************************************************************80
%
%% RAYLEIGH_MEAN returns the mean of the Rayleigh PDF.
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
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = a * sqrt ( 0.5 * pi );

  return
end
