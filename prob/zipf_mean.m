function mean = zipf_mean ( a )

%*****************************************************************************80
%
%% ZIPF_MEAN returns the mean of the Zipf PDF.
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
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Output, real MEAN, the mean of the PDF.
%    The mean is only defined for 2 < A.
%
  if ( a <= 2.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ZIPF_MEAN - Fatal error!\n' );
    fprintf ( 1, '  No mean defined for A <= 2.\n' );
    error ( 'ZIPF_MEAN - Fatal error!' );
  end

  mean = zeta ( a - 1.0 ) / zeta ( a );

  return
end
