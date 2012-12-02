function variance = frechet_variance ( alpha )

%*****************************************************************************80
%
%% FRECHET_VARIANCE returns the variance of the Frechet PDF.
%
%  Discussion:
%
%    The PDF does not have a variance unless 2 < ALPHA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the parameter.
%    It is required that 2.0 < ALPHA.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( alpha <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  Variance does not exist if ALPHA <= 2.\n' );
    error ( 'FRECHET_VARIANCE - Fatal error!' );
  end

  mean = gamma ( ( alpha - 1.0 ) / alpha );

  variance = gamma ( ( alpha - 2.0 ) / alpha ) - mean * mean;

  return
end
