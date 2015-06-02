function jed = ymdf_to_jed_english ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ENGLISH converts an English YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the Julian Ephemeris Date.
%

%
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_english ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Use the Julian Calendar for dates strictly before 1752/9/3.
%
  y1 = 1752;
  m1 = 9;
  d1 = 3;
  f1 = 0.0;

  cmp = ymdf_compare ( y, m, d, f, y1, m1, d1, f1 );

  if ( cmp == '<' )
    jed = ymdf_to_jed_julian ( y, m, d, f );
    return
  end
%
%  Use the Gregorian calendar for dates strictly after 1752/9/13.
%
  y2 = 1752;
  m2 = 9;
  d2 = 13;
  f2 = 0.0;

  cmp = ymdf_compare ( y, m, d, f, y2, m2, d2, f2 );

  if ( cmp == '>' )
    jed = ymdf_to_jed_gregorian ( y, m, d, f );
    return
  end
%
%  Error return if the date falls between the transition dates.
%
  jed = -1.0;

  return
end
