function days = month_length_hindu_solar ( )

%*****************************************************************************80
%
%% MONTH_LENGTH_HINDU_SOLAR returns the number of days in a Hindu solar month.
%
%  Discussion:
%
%    Warning: this is a REAL quantity, with a fractional part%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real DAYS, the number of
%    days in the month.
%
  days = year_length_hindu_solar ( ) / 12.0;

  return
end
