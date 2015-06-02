function mean = fisk_mean ( a, b, c )

%*****************************************************************************80
%
%% FISK_MEAN returns the mean of the Fisk PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  if ( c <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FISK_MEAN - Fatal error!\n' );
    fprintf ( 1, '  No mean defined for C <= 1.0\n' );
    error ( 'FISK_MEAN - Fatal error!' );
  end

  mean = a + pi * ( b / c ) * r8_csc ( pi / c );

  return
end
