function mean = uniform_mean ( a, b )

%*****************************************************************************80
%
%% UNIFORM_MEAN returns the mean of the Uniform PDF.
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
%    Output, real MEAN, the mean of the discrete uniform PDF.
%
  mean = 0.5 * ( a + b );

  return
end
