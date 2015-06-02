function jed = ymdf_to_jed_roman ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_ROMAN converts a Roman YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2013
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
  [ y, m, d, ierror ] = ymd_check_roman ( y, m, d );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end

  y2 = y_roman_to_julian ( y );

  jed = ymdf_to_jed_julian ( y2, m, d, f );

  return
end
