function calpak_test82 ( )

%*****************************************************************************80
%
%% CALPAK_TEST82 tests YMDHMS_DIF_DHMS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2013
%
%  Author:
%
%    John Burkardt
%
  y1 = 1997;
  m1 = 02;
  d1 = 12;
  h1 = 13;
  n1 = 12;
  second1 = 33;

  y2 = 1997;
  m2 = 03;
  d2 = 14;
  h2 = 4;
  n2 = 21;
  second2 = 33;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST82\n' );
  fprintf ( 1, '  YMDHMS_DIF_DHMS finds the DHMS difference\n' );
  fprintf ( 1, '  between YMDHMS dates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMDHMS 1               YMDHMS 2       ' );
  fprintf ( 1, '            Difference\n' );
  fprintf ( 1, '                                        ' );
  fprintf ( 1, '            D   H   M   S\n' );
  fprintf ( 1, '\n' );

  s1 = ymdhms_to_s_common ( y1, m1, d1, h1, n1, second1 );
 
  s2 = ymdhms_to_s_common ( y2, m2, d2, h2, n2, second2 );

  [ days, hours, minutes, seconds, ierror ] = ymdhms_dif_dhms ( y1, m1, d1, ...
    h1, n1, second1, y2, m2, d2, h2, n2, second2 );
 
  fprintf ( 1, '  %20s  %20s  %3d  %3d  %3d  %3d\n', ...
    s1, s2, days, hours, minutes, seconds );
 
  return
end