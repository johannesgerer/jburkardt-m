function calpak_test52 ( )

%*****************************************************************************80
%
%% CALPAK_TEST52 tests YEAR_IS_LEAP_COMMON.
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
  fprintf ( 1, 'CALPAK_TEST52\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_COMMON reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1990 : 2000
    sy = y_to_s_common ( y );
    fprintf ( 1, '  %s  %d\n', sy, year_is_leap_common ( y ) );
  end

  return
end