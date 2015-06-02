function calpak_test74 ( )

%*****************************************************************************80
%
%% CALPAK_TEST74 tests YMDF_INC_JULIAN, YMDF_NEXT_JULIAN, YMDF_PREV_JULIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2013
%
%  Author:
%
%    John Burkardt
%
  days = 10.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST74\n' );
  fprintf ( 1, '  For the Julian calendar:\n' );
  fprintf ( 1, '  YMDF_INC_JULIAN increments a date by days;\n' );
  fprintf ( 1, '  YMDF_NEXT_JULIAN computes the next day,\n' );
  fprintf ( 1, '  YMDF_PREV_JULIAN computes the previous day.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF date    Tomorrow	    Yesterday	   +10.25 days\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )
 
    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end

    [ y1, m1, d1, f1 ] = jed_to_ymdf_julian ( jed );
    s1 = ymdf_to_s_julian ( y1, m1, d1, f1 );

    [ y2, m2, d2, f2 ] = ymdf_next_julian ( y1, m1, d1, f1 );
    s2 = ymdf_to_s_julian ( y2, m2, d2, f2 );

    [ y3, m3, d3, f3 ] = ymdf_prev_julian ( y1, m1, d1, f1 );
    s3 = ymdf_to_s_julian ( y3, m3, d3, f3 );
 
    [ y4, m4, d4, f4 ] = ymdf_inc_julian ( y1, m1, d1, f1, days );
    s4 = ymdf_to_s_julian ( y4, m4, d4, f4 );

    fprintf ( 1, '  %15s  %15s  %15s  %15s\n', s1, s2, s3, s4 );

  end

  return
end
