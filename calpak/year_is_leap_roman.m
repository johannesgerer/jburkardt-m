function value = year_is_leap_roman ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_ROMAN returns TRUE if the Roman year was a leap year.
%
%  Discussion:
%
%    For our unrealistic and idealized Roman calendar, we are going to
%    take a year to have been a leap year if the corresponding year in
%    the idealized Julian calendar was a leap year.
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
%    Output, logical VALUE, TRUE if the year was a leap year.
%
  ierror = y_check_roman ( y );

  if ( ierror ~= 0 )
    value = 0;
    return
  end

  y2 = y_roman_to_julian ( y );

  value = year_is_leap_julian ( y2 );

  return
end
