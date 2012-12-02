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
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical YEAR_IS_LEAP_GREGORIAN, TRUE if the year was a leap year,
%    FALSE otherwise.
%
  if ( y <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_IS_LEAP_GREGORIAN - Fatal error!\n' );
    fprintf ( 1, '  This function will not accept nonpositive years.\n' );
    error ( 'YEAR_IS_LEAP_GREGORIAN - Fatal error!' );
  end

  if ( mod ( y, 400 ) == 0 )
    value = 1;
  elseif ( mod ( y, 100 ) == 0 )
    value = 0;
  elseif ( mod ( y, 4 ) == 0 )
    value = 1;
  else
    value = 0;
  end

  return
end
