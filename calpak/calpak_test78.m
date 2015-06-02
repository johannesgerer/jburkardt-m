function calpak_test78 ( )

%*****************************************************************************80
%
%% CALPAK_TEST78 tests YMDF_TO_WEEKDAY_GREGORIAN*.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST78\n' );
  fprintf ( 1, '  For the Gregorian calendar:\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_GREGORIAN,\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_GREGORIAN2,\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_GREGORIAN3,\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_GREGORIAN4, and\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_GREGORIAN5\n' );
  fprintf ( 1, '  return the day of the week.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (This is "easy" to do for recent dates,\n' );
  fprintf ( 1, '  but look closely at early dates!)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED   YMDF    Day of the week\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0 )
      break
    end

    jed2 = jed_to_next_noon ( jed1 );

    [ y1, m1, d1, f1 ] = jed_to_ymdf_gregorian ( jed2 );
    s1 = ymdf_to_s_gregorian ( y1, m1, d1, f1 ); 
 
    w2 = ymdf_to_weekday_gregorian ( y1, m1, d1, f1 );
    s2 = weekday_to_name_common ( w2 );

    w3 = ymdf_to_weekday_gregorian2 ( y1, m1, d1, f1 );
    s3 = weekday_to_name_common ( w3 );

    w4 = ymdf_to_weekday_gregorian3 ( y1, m1, d1, f1 );
    s4 = weekday_to_name_common ( w4 );

    w5 = ymdf_to_weekday_gregorian4 ( y1, m1, d1, f1 );
    s5 = weekday_to_name_common ( w5 );

    w6 = ymdf_to_weekday_gregorian5 ( y1, m1, d1, f1 );
    s6 = weekday_to_name_common ( w6 );

    fprintf ( 1, '  %11.2f  %20s  %7s  %7s\n', jed1, s1, s2, s3 );
    fprintf ( 1, '                                     %7s  %7s  %7s\n', ...
      s4, s5, s6 );

  end

  return
end
