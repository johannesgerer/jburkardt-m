function calpak_test535 ( )

%*****************************************************************************80
%
%% CALPAK_TEST535 tests YEAR_IS_LEAP_GREEK.
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
  fprintf ( 1, 'CALPAK_TEST535\n' );
  fprintf ( 1, '  For the Greek calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_GREEK reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 10
    sy = y_to_s_greek ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_is_leap_greek ( y ) );
  end

  return
end