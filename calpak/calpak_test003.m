function calpak_test003 ( )

%*****************************************************************************80
%
%% CALPAK_TEST003 tests JED_TO_MAYAN_LONG and MAYAN_LONG_TO_JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST003\n' );
  fprintf ( 1, '  For converting between Julian Ephemeris Dates\n' );
  fprintf ( 1, '  and Mayan Long Count dates:\n' );
  fprintf ( 1, '  JED_TO_MAYAN_LONG,\n' );
  fprintf ( 1, '  MAYAN_LONG_TO_JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)       MAYAN			   JED (out)\n' );
  fprintf ( 1, '                 P   B   K   T   U   D\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_mayan_long ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );
 
    if ( jed1 < 0.0 )
      break;
    end

    if ( jed_epoch <= jed1 ) 

      [ pictun, baktun, katun, tun, uinal, kin, f ] = jed_to_mayan_long ( jed1 );

      jed3 = mayan_long_to_jed ( pictun, baktun, katun, tun, uinal, kin, f );

      fprintf ( 1, '  %11.2f     %4i%4i%4i%4i%4i%4i     %11.2f\n', ...
        jed1, pictun, baktun, katun, tun, uinal, kin, jed3 );

      end

  end

  return
end
