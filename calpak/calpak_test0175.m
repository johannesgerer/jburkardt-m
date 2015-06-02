function calpak_test0175 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0175 tests JED_TO_YMDF_EG_LUNAR and YMDF_TO_JED_EG_LUNAR.
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
  fprintf ( 1, 'CALPAK_TEST0175\n' );
  fprintf ( 1, '  For the Egyptian Lunar calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_EG_LUNAR: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_EG_LUNAR: YMDF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF               JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_eg_lunar ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end
    
    if ( jed_epoch <= jed1 )

      [ y2, m2, d2, f2 ] = jed_to_ymdf_eg_lunar ( jed1 );

      s2 = ymd_to_s_eg_lunar ( y2, m2, d2 );

      jed3 = ymdf_to_jed_eg_lunar ( y2, m2, d2, f2 );

      fprintf ( 1, '  %11.2f  %20s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end