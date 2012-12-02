function value = year_length_bahai ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_BAHAI returns the number of days in a Bahai year.
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
  if ( year_is_leap_bahai ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
