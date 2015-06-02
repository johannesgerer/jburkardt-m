function calpak_test75 ( )

%*****************************************************************************80
%
%% CALPAK_TEST75 tests YMD_INC_YMD_COMMON and YMDF_DIF_YMDF_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST75\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  YMD_INC_YMD_COMMON increments a YMDF date by YMDF;\n' );
  fprintf ( 1, '  YMDF_DIF_YMDF_COMMON finds the YMDF difference.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Date1        increment    Date2          difference\n' );
  fprintf ( 1, '\n' );

  y1 = 1900;
  m1 = 5;
  d1 = 27;
  f1 = 0.0;

  yn1 = 50;
  mn1 = 9;
  dn1 = 10;
  fn2 = 0.0;

  [ y2, m2, d2 ] = ymd_inc_ymd_common ( y1, m1, d1, yn1, mn1, dn1 );
  f2 = 0.0;

  [ yn2, mn2, dn2, fn2, ierror ] = ymdf_dif_ymdf_common ( y1, m1, d1, f1, ...
  y2, m2, d2, f2 );

  s1 = ymdf_to_s_common ( y1, m1, d1, f1 );

  s2 = ymdf_to_s_common ( y2, m2, d2, f2 );

  fprintf ( 1, '  %15s  %3d  %3d  %3d  %15s  %3d  %3d  %3d\n', ...
    s1, yn1, mn1, dn1, s2, yn2, mn2, dn2 );

  return
end
