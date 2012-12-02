function variance = zipf_variance ( a )

%*****************************************************************************80
%
%% ZIPF_VARIANCE returns the variance of the Zipf PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Output, real VARIANCE, the variance of the PDF.
%    The variance is only defined for 3 < A.
%
  if ( a <= 3.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ZIPF_VARIANCE - Fatal error!\n' );
    fprintf ( 1, '  No variance defined for A <= 3.0.\n' );
    error ( 'ZIPF_VARIANCE - Fatal error!' );
  end

  mean = zipf_mean ( a );

  variance = zeta ( a - 2.0 ) / zeta ( a ) - mean * mean;

  return
end
