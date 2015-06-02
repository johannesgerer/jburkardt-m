function calpak_test5156 ( )

%*****************************************************************************80
%
%% CALPAK_TEST5156 tests YEAR_IS_LEAP_BAHAI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST5156\n' );
  fprintf ( 1, '  For the Bahai calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_BAHAI reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1990 : 2000
    sy = y_to_s_bahai ( y );
    fprintf ( 1, '  %s  %d\n', sy, year_is_leap_bahai ( y ) );
  end

  return
end