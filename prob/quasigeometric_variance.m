function variance = quasigeometric_variance ( a, b )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_VARIANCE returns the variance of the Quasigeometric PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( 1.0 - a ) * ( a + b ) / ( 1.0 - b ) / ( 1.0 - b );

  return
end
