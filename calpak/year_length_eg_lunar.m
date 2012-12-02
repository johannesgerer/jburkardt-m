function value = year_length_eg_lunar ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_EG_LUNAR returns the number of days in an Egyptian Lunar year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, integer VALUE, the number of
%    days in the year.
%
  if ( .not. year_is_embolismic_eg_lunar ( y ) )
    value = 354;
  else
    value = 384;
  end

  if ( year_is_leap_eg_lunar ( y ) )
    value = value + 1;
  end

  return
end
