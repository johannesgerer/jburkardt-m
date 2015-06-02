function calpak_test80 ( )

%*****************************************************************************80
%
%% CALPAK_TEST80 tests YMDF_TO_WEEKDAY_JULIAN*.
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
  fprintf ( 1, 'CALPAK_TEST80\n' );
  fprintf ( 1, '  For the Julian calendar,\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_JULIAN,\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_JULIAN2, and\n' );
  fprintf ( 1, '  YMDF_TO_WEEKDAY_JULIAN3\n' );
  fprintf ( 1, '  return the day of the week of a given date.\n' );
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

    [ y1, m1, d1, f1 ] = jed_to_ymdf_julian ( jed2 );
    s1 = ymdf_to_s_julian ( y1, m1, d1, f1 );
 
    w2 = ymdf_to_weekday_julian ( y1, m1, d1, f1 );
    s2 = weekday_to_name_common ( w2 );

    w3 = ymdf_to_weekday_julian2 ( y1, m1, d1, f1 );
    s3 = weekday_to_name_common ( w3 );

    w4 = ymdf_to_weekday_julian2 ( y1, m1, d1, f1 );
    s4 = weekday_to_name_common ( w4 );

    fprintf ( 1, '  %11.2f  %9s  %9s  %9s  %9s\n', jed2, s1, s2, s3, s4 );

  end

  return
end