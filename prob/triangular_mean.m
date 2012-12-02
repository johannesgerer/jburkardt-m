function mean = triangular_mean ( a, b )

%*****************************************************************************80
%
%% TRIANGULAR_MEAN returns the mean of the Triangular PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2004
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = 0.5 * ( a + b );

  return
end
