function calpak_test19 ( )

%*****************************************************************************80
%
%% CALPAK_TEST19 tests JED_TO_YMDF_ISLAMIC_B and YMDF_TO_JED_ISLAMIC_B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST19\n' );
  fprintf ( 1, '  For the Islamic B calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_ISLAMIC_B: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_ISLAMIC_B: YMDF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF                JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_islamic_b ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y2, m2, d2, f2 ] = jed_to_ymdf_islamic_b ( jed1 );

      s2 = ymdf_to_s_islamic ( y2, m2, d2, f2 );

      jed3 = ymdf_to_jed_islamic_b ( y2, m2, d2, f2 );

      fprintf ( 1, '  %11.2f  %20s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end