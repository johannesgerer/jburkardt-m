function calpak_test71 ( )

%*****************************************************************************80
%
%% TEST71 tests YMDF_INC_ENGLISH, YMDF_NEXT_ENGLISH, YMDF_PREV_ENGLISH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
  days = 10.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST71\n' );
  fprintf ( 1, '  For the English calendar:\n' );
  fprintf ( 1, '  YMDF_INC_ENGLISH increments a date by days;\n' );
  fprintf ( 1, '  YMDF_NEXT_ENGLISH computes the next day,\n' );
  fprintf ( 1, '  YMDF_PREV_ENGLISH computes the previous day.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF	  Tomorrow	 Yesterday	+10.25 days\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )
 
    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end

    [ y1, m1, d1, f1 ] = jed_to_ymdf_english ( jed );

    s1 = ymdf_to_s_english ( y1, m1, d1, f1 );

    [ y2, m2, d2, f2 ] = ymdf_next_english ( y1, m1, d1, f1 );
    s2 = ymdf_to_s_english ( y2, m2, d2, f2 );

    [ y3, m3, d3, f3 ] = ymdf_prev_english ( y1, m1, d1, f1 );
    s3 = ymdf_to_s_english ( y3, m3, d3, f3 );
 
    [ y4, m4, d4, f4 ] = ymdf_inc_english ( y1, m1, d1, f1, days );
    s4 = ymdf_to_s_english ( y4, m4, d4, f4 );

    fprintf ( 1, '  %15s  %15s  %15s  %15s\n', s1, s2, s3, s4 );

  end

  return
end
