function calpak_test00755 ( )

%*****************************************************************************80
%
%% CALPAK_TEST00755 tests JED_TO_NYT and NYT_TO_JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 February 2013
%
%  Author:
%
%    John Burkardt
%
  jed_nyt_epoch = epoch_to_jed_nyt ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST00755\n' );
  fprintf ( 1, '  For the New York Times issue date:\n' );
  fprintf ( 1, '  JED_TO_NYT: JED -> NYT.\n' );
  fprintf ( 1, '  NYT_TO_JED: NYT -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                           JED (in)      Volume  Issue            JED (out)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );

    if ( jed1 < 0.0 )
      break
    end

    if ( jed1 < jed_nyt_epoch )
      continue
    end

    [ y, m, d, f ] = jed_to_ymdf_common ( jed1 );

    s = ymdf_to_s_common ( y, m, d, f );

    [ volume2, issue2 ] = jed_to_nyt ( jed1 );

    jed3 = nyt_to_jed ( volume2, issue2 );

    fprintf ( 1, '  %25s  %11.2f     %4d  %8d     %11.2f\n', s, jed1, volume2, issue2, jed3 );

  end

  return
end