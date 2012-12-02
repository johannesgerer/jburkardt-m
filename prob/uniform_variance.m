function variance = uniform_variance ( a, b )

%*****************************************************************************80
%
%% UNIFORM_VARIANCE returns the variance of the Uniform PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    A < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( b - a )^2 / 12.0;

  return
end
