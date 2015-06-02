function calpak_test46 ( )

%*****************************************************************************80
%
%% CALPAK_TEST46 tests NOW_TO_JED, NOW_TO_YJF_COMMON, NOW_TO_YMDF_COMMON, NOW_TO_YMDHMS_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST46\n' );
  fprintf ( 1, '  For the current time and date, "NOW", \\n' );
  fprintf ( 1, '  NOW_TO_JED returns the JED,\n' );
  fprintf ( 1, '  NOW_TO_YJF_COMMON the YJF date,\n' );
  fprintf ( 1, '  NOW_TO_YMDF_COMMON returns the YMDF date,\n' );
  fprintf ( 1, '  NOW_TO_YMDHMS_COMMON the YMDHMS date.\n' );
  fprintf ( 1, '\n' );

  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '  "NOW" is %s\n', s );

  jed = now_to_jed ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NOW_TO_JED_COMMON:    Now is: %11.1f\n', jed );

  [ y, j, f ] = now_to_yjf_common ( );
  s = yjf_to_s_common ( y, j, f );

  fprintf ( 1, '  NOW_TO_YJF_COMMON:    Now is: %s\n', s );

  [ y, m, d, f ] = now_to_ymdf_common ( );
  s = ymdf_to_s_common ( y, m, d, f );

  fprintf ( 1, '  NOW_TO_YMDF_COMMON:   Now is: %s\n', s );

  [ y, m, d, h, n, second ] = now_to_ymdhms_common ( );
  s = ymdhms_to_s_common ( y, m, d, h, n, second );

  fprintf ( 1, '  NOW_TO_YMDHMS_COMMON: Now is: %s\n', s );

  return
end