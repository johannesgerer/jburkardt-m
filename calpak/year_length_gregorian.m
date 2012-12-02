function value = year_length_gregorian ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_GREGORIAN returns the number of days in a Gregorian year.
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
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_LENGTH_GREGORIAN - Fatal error!\n' );
    fprintf ( 1, '  Illegal Y = 0.\n' );
    error ( 'YEAR_LENGTH_GREGORIAN - Fatal error!' );
  end

  if ( year_is_leap_gregorian ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
