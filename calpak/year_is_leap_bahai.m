function value = year_is_leap_bahai ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_BAHAI returns TRUE if the Bahai year was a leap year.
%
%  Discussion:
%
%    The leap year rules are the same as those used in the Gregorian
%    calendar.
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

  if ( mod ( y, 400 ) == 0 )
    value = 1;
  elseif ( mod ( y, 100 ) == 0 )
    value = 0;
  elseif ( mod ( y, 4 ) == 0 )
    value = 1;
  else
    value = 0;
  end

  return
end
