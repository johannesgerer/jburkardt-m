function mean = uniform_discrete_mean ( a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_MEAN returns the mean of the Uniform discrete PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = 0.5 * ( a + b );

  return
end
