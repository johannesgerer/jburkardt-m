function mean = frechet_mean ( alpha )

%*****************************************************************************80
%
%% FRECHET_MEAN returns the mean of the Frechet PDF.
%
%  Discussion:
%
%    The distribution does not have a mean value unless 1 < ALPHA.
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
%    It is required that 1.0 < ALPHA.
%
%    Output, real MEAN, the mean of the PDF.
%
  if ( alpha <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_MEAN - Fatal error!\n' );
    fprintf ( 1, '  Mean does not exist if ALPHA <= 1.\n' );
    error ( 'FRECHET_MEAN - Fatal error!' );
  end

  mean = gamma ( ( alpha - 1.0 ) / alpha );

  return
end
