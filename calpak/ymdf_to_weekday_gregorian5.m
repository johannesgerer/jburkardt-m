function w = ymdf_to_weekday_gregorian5 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_GREGORIAN5 returns the weekday of a Gregorian YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    CRC Press, 2000, page 738.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  [ y, m, d, ierror ] = ymd_check_gregorian ( y, m, d );

  if ( ierror ~= 0 )
    w = 0;
    return
  end

  c = floor ( y / 100 );
  yy = y - c * 100;

  if ( m < 3 )
    mm = m + 10;
    yy = yy - 1;
  else
    mm = m - 2;
  end

  days = d + floor ( 2.6 * mm - 0.2 ) - 2 * c + yy + floor ( yy / 4 ) ...
    + floor ( c / 4 );

  w = i4_modp ( days, 7 ) + 1;

  return
end