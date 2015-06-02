function calpak_test53 ( )

%*****************************************************************************80
%
%% CALPAK_TEST53 tests YEAR_IS_LEAP_ENGLISH.
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
  fprintf ( 1, 'CALPAK_TEST53\n' );
  fprintf ( 1, '  For the English calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_ENGLISH reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1990 : 2000
    sy = y_to_s_english ( y );
    fprintf ( 1, '  %s  %d\n', sy, year_is_leap_english ( y ) );
  end

  return
end

