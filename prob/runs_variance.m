function variance = runs_variance ( m, n )

%*****************************************************************************80
%
%% RUNS_VARIANCE returns the variance of the Runs PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the PDF.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( 2 * m * n * ( 2 * m * n - m - n ) ) ...
           / ( ( m + n ) * ( m + n ) * ( m + n - 1 ) );

  return
end
