function calpak_test525 ( )

%*****************************************************************************80
%
%% CALPAK_TEST525 tests YEAR_IS_LEAP_EG_LUNAR.
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
  fprintf ( 1, 'CALPAK_TEST525\n' );
  fprintf ( 1, '  For the Egyptian Lunar calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_EG_LUNAR reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 10
    sy = y_to_s_eg_lunar ( y );
    fprintf ( 1, '  %s  %d\n', sy, year_is_leap_eg_lunar ( y ) );
  end

  return
end
