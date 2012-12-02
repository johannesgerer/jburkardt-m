function value = year_is_leap_julian ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_JULIAN returns TRUE if the Julian year was a leap year.
%
%  Algorithm:
%
%    If ( Y < 0 and Y+1 is divisible by 4 ) then
%      the year is a leap year.
%    else if ( Y == 0 ) then
%      the year is illegal
%    else if ( 0 < Y and Y is divisible by 4 ) then
%      the year is a leap year.
%    else
%      the year is NOT a leap year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2008
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
  if ( y == 0 )
    value = 0;
    return
  end

  y2 = y_common_to_astronomical ( y );

  if ( i4_modp ( y2, 4 ) == 0 )
    value = 1;
  else
    value = 0;
  end

  return
end
