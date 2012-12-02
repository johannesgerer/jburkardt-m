function doomsday_test01 ( )

%*****************************************************************************80
%
%% DOOMSDAY_TEST01 tests DOOMSDAY against a couple of test dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DOOMSDAY_TEST01\n' );
  fprintf ( 1, '  Try a couple selected dates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YYYY  MM  DD  Weekday    Weekday\n' );
  fprintf ( 1, '                Tabulated  Computed\n' );
  fprintf ( 1, '\n' );

  y = 1989;
  m = 7;
  d = 13;
  w = doomsday_gregorian ( y, m, d );
  s1 = weekday_to_name_common ( w );
  s2 = 'Thursday';
  fprintf ( 1, '  %4d  %2d  %2d  %10s  %10s\n', y, m, d, s1, s2 );

  y = 2012;
  m = 5;
  d = 26;
  w = doomsday_gregorian ( y, m, d );
  s1 = weekday_to_name_common ( w );
  s2 = 'Saturday';
  fprintf ( 1, '  %4d  %2d  %2d  %10s  %10s\n', y, m, d, s1, s2 );

  return
end
