function value = year_is_leap_eg_lunar ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_EG_LUNAR: TRUE if the Egyptian Lunar year was a leap year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical VALUE, TRUE if the year was a leap year,
%    FALSE otherwise.
%
  if ( y <= 0 )
    value = 0;
    return
  end

  if ( mod ( y, 5 ) == 0 )
    value = 1;
  else
    value = 0;
  end

  return
end