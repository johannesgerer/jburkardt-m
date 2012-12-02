function variance = burr_variance ( a, b, c, d )

%*****************************************************************************80
%
%% BURR_VARIANCE returns the variance of the Burr PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  if ( c <= 2.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'BURR_VARIANCE - Warning!\n' );
    fprintf ( 1, '  Variance undefined for C <= 2.\n' );
    variance = r8_huge ( );

  else

    k = gamma ( d ) * gamma ( 1.0 - 2.0 / c ) * gamma ( d + 2.0 / c ) ...
      - ( gamma ( 1.0 - 1.0 / c ) * gamma ( d + 1.0 / c ) )^2;

    variance = k * b * b / ( gamma ( d ) )^2;

  end

  return
end
