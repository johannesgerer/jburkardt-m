function calpak_test73 ( )

%*****************************************************************************80
%
%% CALPAK_TEST73 tests YMDF_INC_HEBREW, YMDF_NEXT_HEBREW, YMDF_PREV_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST73\n' );
  fprintf ( 1, '  For the Hebrew calendar:\n' );
  fprintf ( 1, '  YMDF_INC_HEBREW increments a date by days;\n' );
  fprintf ( 1, '  YMDF_NEXT_HEBREW computes the next day,\n' );
  fprintf ( 1, '  YMDF_PREV_HEBREW computes the previous day.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDF        Tomorrow          Yesterday         +10.25 days\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_hebrew ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed = jed_test ( i );

    if ( jed < 0 )
      break
    end

    if ( jed_epoch + 1 <= jed )

      [ y1, m1, d1, f1 ] = jed_to_ymdf_hebrew ( jed );
      s1 = ymdf_to_s_hebrew ( y1, m1, d1, f1 );

      [ y2, m2, d2, f2 ] = ymdf_next_hebrew ( y1, m1, d1, f1 );
      s2 = ymdf_to_s_hebrew ( y2, m2, d2, f2 );

      [ y3, m3, d3, f3 ] = ymdf_prev_hebrew ( y1, m1, d1, f1 );
      s3 = ymdf_to_s_hebrew ( y3, m3, d3, f3 );
 
      [ y4, m4, d4, f4 ] = ymdf_inc_hebrew ( y1, m1, d1, f1, days );
      s4 = ymdf_to_s_hebrew ( y4, m4, d4, f4 );

      fprintf ( 1, '  %15s  %15s  %15s  %15s\n', s1, s2, s3, s4 );

    end

  end

  return
end
