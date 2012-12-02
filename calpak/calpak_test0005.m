function calpak_test0005 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0005 tests CWS_TO_JED_GPS and JED_TO_CWS_GPS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0005\n' );
  fprintf ( 1, '  For the GPS calendar:\n' );
  fprintf ( 1, '  JED_TO_CWS_GPS: JED -> CWS.\n' );
  fprintf ( 1, '  CWS_TO_JED_GPS: CWS -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   JED (in)       CWS                            JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_gps ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ c2, w2, sec2 ] = jed_to_cws_gps ( jed1 );

      s2 = cws_to_s_gps ( c2, w2, sec2 );

      jed3 = cws_to_jed_gps ( c2, w2, sec2 );

      fprintf ( 1, '  %11.2f     %s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end
