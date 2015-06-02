function value = year_length_english ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ENGLISH returns the number of days in an English year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 December 2013
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
    fprintf ( 1, 'YEAR_LENGTH_ENGLISH - Fatal error!\n' );
    fprintf ( 1, '  Illegal Y = 0.\n' );
    error ( 'YEAR_LENGTH_ENGLISH - Fatal error!' );
  end

  if ( y == 1752 )
    value = 355;
  elseif ( year_is_leap_english ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
