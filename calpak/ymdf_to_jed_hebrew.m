function jed = ymdf_to_jed_hebrew ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_HEBREW converts a Hebrew YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm J,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 334.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the corresponding JED.
%

%
%  Check the date.
%
  [ y, m, d, ierror ] = ymd_check_hebrew ( y, m, d );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMDF_TO_JED_HEBREW - Fatal error!\n' );
    fprintf ( 1, '  Illegal date.\n' );
    fprintf ( 1, '  Y/M/D = %d/%d/%d\n', y, m, d );
    jed = -1.0;
    return
  end
%
%  Determine the JED of the beginning of the year.
%
  jed = new_year_to_jed_hebrew ( y );
%
%  Work through the preceding months.
%
  for m2 = 1 : m - 1
    jed = jed + month_length_hebrew ( y, m2 );
  end
%
%  Add on the days.
%
  jed = jed + d - 1;
  jed = jed + f;

  return
end
