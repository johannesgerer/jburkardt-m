function moment = truncated_normal_b_moment ( order, mu, s, b )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_MOMENT returns a moment of the upper truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Phoebus Dhrymes,
%    Moments of Truncated Normal Distributions,
%    May 2005.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real B, the upper truncation limit.
%
%    Output, real MOMENT, the moment of the PDF.
%
  if ( order < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 0.\n' );
    error ( 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
  end

  h = ( b - mu ) / s;
  pdf = normal_01_pdf ( h );
  cdf = normal_01_cdf ( h );

  if ( cdf == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
    fprintf ( 1, '  PDF/CDF ratio fails, because CDF too small.\n', cdf );
    fprintf ( 1, '  PDF = %g\n', pdf );
    fprintf ( 1, '  CDF = %g\n', cdf );
    error ( 'TRUNCATED_NORMAL_B_MOMENT - Fatal error!\n' );
  end

  f = pdf / cdf;

  moment = 0.0;
  irm2 = 0.0;
  irm1 = 0.0;

  for r = 0 : order

    if ( r == 0 )
      ir = 1.0;
    elseif ( r == 1 )
      ir = - f;
    else
      ir = - h ^ ( r - 1 ) * f + ( r - 1 ) * irm2;
    end

    moment = moment + r8_choose ( order, r ) ...
      * mu ^ ( order - r ) ...
      * s ^ r * ir;

    irm2 = irm1;
    irm1 = ir;

  end

  return
end
