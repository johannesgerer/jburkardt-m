function calpak_test0125 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0125 tests JED_TO_YMDF_ALEXANDRIAN and YMDF_TO_JED_ALEXANDRIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0125\n' );
  fprintf ( 1, '  For the Alexandrian calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_ALEXANDRIAN: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_ALEXANDRIAN: YMDF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF               JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_alexandrian ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y2, m2, d2, f2 ] = jed_to_ymdf_alexandrian ( jed1 );

      s2 = ymd_to_s_alexandrian ( y2, m2, d2 );

      jed3 = ymdf_to_jed_alexandrian ( y2, m2, d2, f2 );

      fprintf ( 1, '  %11.2f     %25s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end
