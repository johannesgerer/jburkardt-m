function calpak_test44 ( )

%*****************************************************************************80
%
%% CALPAK_TEST44 tests MOON_PHASE_TO_JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST44\n' );
  fprintf ( 1, '  MOON_PHASE_TO_JED reports the JED on\n' );
  fprintf ( 1, '  which a phase of the moon occurs.\n' );
  fprintf ( 1, '\n' );

  phase = 2;

  fprintf ( 1, '   N JED        YMDHMS date\n' );
  fprintf ( 1, '\n' );

  for nphase = 1 : 10
    jed = moon_phase_to_jed ( nphase, phase );
    [ y, m, d, f ] = jed_to_ymdf_common ( jed );
    [ h, min, sec ] = frac_to_hms ( f );
    s = ymdhms_to_s_common ( y, m, d, h, min, sec );
    fprintf ( 1, '  %3d  %11.2f   %s\n', nphase, jed, s );
  end

  return
end