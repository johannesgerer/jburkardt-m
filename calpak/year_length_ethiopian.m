function value = year_length_ethiopian ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ETHIOPIAN returns the number of days in an Ethiopian year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
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
  if ( year_is_leap_ethiopian ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end