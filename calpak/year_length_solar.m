function value = year_length_solar ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_SOLAR returns the number of days in a "solar" year.
%
%  Discussion:
%
%    The "solar" year is taken to be the mean tropical year.
%    The number of days in a mean tropical year has varied from
%    365.2424992 in 4000 BC to 365.2421897 in 2000 AD.
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
%    Output, real  VALUE, the number of days
%    in the year.
%
  if ( y < 1 ) 
    y2 = y + 1;
  else
    y2 = y;
  end

  if ( y2 < - 4000 )
    value = 365.2424992;
  elseif ( y2 <= 2000 )
    value = &
      ( ( 2000 - y2 ) * 365.2424992 ...
      + ( 4000 + y2 ) * 365.2421897 ) ...
      /        6000.0;
  else
    value = 365.2421897;
  end

  return
end