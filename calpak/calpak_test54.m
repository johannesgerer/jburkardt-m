function calpak_test54 ( )

%*****************************************************************************80
%
%% CALPAK_TEST54 tests YEAR_IS_LEAP_GREGORIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST54\n' );
  fprintf ( 1, '  For the Gregorian calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_GREGORIAN reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1990 : 2000
    sy = y_to_s_gregorian ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_is_leap_gregorian ( y ) );
  end

  return
end