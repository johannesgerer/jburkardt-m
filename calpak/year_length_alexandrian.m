function value = year_length_alexandrian ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ALEXANDRIAN returns the number of days in an Alexandrian year.
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
  if ( year_is_leap_alexandrian ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
