function value = year_length_islamic ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ISLAMIC returns the number of days in an Islamic year.
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
  if ( year_is_leap_islamic ( y ) )
    value = 355;
  else
    value = 354;
  end

  return
end
