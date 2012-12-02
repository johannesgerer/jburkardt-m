function calendar_nyt_test01 ( )

%*****************************************************************************80
%
%% CALENDAR_NYT_TEST01 tests JED_TO_NYT and NYT_TO_JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  jed_nyt_epoch = epoch_to_jed_nyt ( );
  jed_now = now_to_jed ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALENDAR_NYT_TEST01\n' );
  fprintf ( 1, '  For the New York Times issue date:\n' );
  fprintf ( 1, '  JED_TO_NYT: JED -> NYT.\n' );
  fprintf ( 1, '  NYT_TO_JED: NYT -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                           JED (in)      Volume  Issue            JED (out)   Diff\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : test_num

    [ jed1, seed ] = r8_uniform ( jed_nyt_epoch, jed_now, seed );

    jed1 = round ( jed1 ) + 0.5;

    [ y, m, d, f] = jed_to_ymdf_common ( jed1 );

    s = ymdf_to_s_common ( y, m, d, f );

    [ volume2, issue2 ] = jed_to_nyt ( jed1 );

    jed3 = nyt_to_jed ( volume2, issue2 );

    diff = jed1 - jed3;

    fprintf ( 1, '  %25s  %11.2f     %4d  %8d  %11.2f  %11.2f\n', ...  
      s, jed1, volume2, issue2, jed3, diff );

  end

  return
end
