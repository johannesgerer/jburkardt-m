function variance = uniform_discrete_variance ( a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_VARIANCE returns the variance of the Uniform discrete PDF.
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
%    Input, integer A, B, the parameters of the PDF.
%    A <= B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( ( b + 1 - a )^2 - 1 ) / 12.0;

  return
end
