function calpak_test004 ( )

%*****************************************************************************80
%
%% CALPAK_TEST004 tests JED_TO_MAYAN_ROUND and MAYAN_ROUND_TO_JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST004\n' );
  fprintf ( 1, '  For converting between Julian Ephemeris Dates\n' );
  fprintf ( 1, '  and Mayan Round dates:\n' );
  fprintf ( 1, '  JED_TO_MAYAN_ROUND,\n' );
  fprintf ( 1, '  MAYAN_ROUND_TO_JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)      MAYAN                       JED (out)\n' );
  fprintf ( 1, '                Y   A   B   C  D  F\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_mayan_long ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );
 
    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y2, a2, b2, c2, d2, f2 ] = jed_to_mayan_round ( jed1 );

      jed3 = mayan_round_to_jed ( y2, a2, b2, c2, d2, f2 );

      fprintf ( 1, '  %11.2f     %4i%4i%4i%4i%4i%5.2f     %11.2f\n', ...
        jed1, y2, a2, b2, c2, d2, f2, jed3 );

    end

  end

  return
end
