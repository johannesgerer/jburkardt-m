function calpak_test555 ( )

%*****************************************************************************80
%
%% CALPAK_TEST555 tests YEAR_IS_LEAP_ISLAMIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST555\n' );
  fprintf ( 1, '  For the Islamic calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_ISLAMIC reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 500 : 510
    sy = y_to_s_islamic ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_is_leap_islamic ( y ) );
  end

  return
end

