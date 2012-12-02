function value = year_is_leap_gregorian ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_GREGORIAN returns TRUE if the Gregorian year was a leap year.
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
  if ( y == 0 )
    value = 0;
    return
  end
%
%  BC years have to have 1 added to them to make a proper leap year evaluation.
%
  y2 = y_common_to_astronomical ( y );

  if ( mod ( y2, 400 ) == 0 )
    value = 1;
  elseif ( mod ( y2, 100 ) == 0 )
    value = 0;
  elseif ( mod ( y2, 4 ) == 0 )
    value = 1;
  else
    value = 0;
  end

  return
end
