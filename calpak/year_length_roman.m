function value = year_length_roman ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ROMAN returns the number of days in a Roman year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, integer VALUE, the number of days
%    in the year.
%
  if ( year_is_leap_roman ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end