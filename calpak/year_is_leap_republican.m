function value = year_is_leap_republican ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_REPUBLICAN returns TRUE if the Republican year was a leap year.
%
%  Discussion:
%
%    The French Republican calendar was in use for 14 years.
%    In that time, years 3, 7 and 11 were designated as leap years.
%    The easiest way to harmonize the rules and history is to apply
%    the leap year rules to Y+1.
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
%    Input, integer ( kind = 4 ) Y, the year to be checked.
%
%    Output, logical VALUE, TRUE if the year was a leap year,
%    FALSE otherwise.
%
  y2 = y;

  ierror = y_check_republican ( y2 );

  if ( ierror ~= 0 )
    value = 0;
    return
  end

  value = 0;

  if ( mod ( y2 + 1, 4 ) == 0 )
    value = 1;
    if ( mod ( y2 + 1, 100 ) == 0 )
      value = 0;
      if ( mod ( y2 + 1, 400 ) == 0 )
        value = 1;
        if ( mod ( y2 + 1, 4000 ) == 0 )
          value = 0;
        end if
      end if
    end if
  end if

  return
end
