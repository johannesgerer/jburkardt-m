function [ y, m, d, f ] = jed_to_ymdf_eg_lunar ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_EG_LUNAR converts a JED to an Egyptian Lunar YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%
  jed_epoch = epoch_to_jed_eg_lunar ( );

  j = floor ( jed - jed_epoch );
  f = ( jed - jed_epoch ) - j;

  d = 1 + j;
  m = 1;
  y = 1;
%
%  Account for the number of 25 year cycles of 9125 days.
%
  ncycle = floor ( d / 9125 );
  y = y + 25 * ncycle;
  d = d - ncycle * 9125;

  while ( year_length_eg_lunar ( y ) < d )
    d = d - year_length_eg_lunar ( y );
    y = y + 1;
  end

  while ( month_length_eg_lunar ( y, m ) < d )
    d = d - month_length_eg_lunar ( y, m );
    m = m + 1;
  end

  return
end
