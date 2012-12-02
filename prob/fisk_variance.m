function variance = fisk_variance ( a, b, c )

%*****************************************************************************80
%
%% FISK_VARIANCE returns the variance of the Fisk PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( c <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FISK_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  No variance defined for C <= 2.0\n' );
    error ( 'FISK_VARIANCE - Fatal error!' );
  end

  g = pi / c;

  variance = b^2 * ( 2.0 * g * csc ( 2.0 * g ) - ( g * csc ( g ) )^2 );

  return
end
