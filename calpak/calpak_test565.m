function calpak_test565 ( )

%*****************************************************************************80
%
%% CALPAK_TEST565 tests YEAR_IS_LEAP_REPUBLICAN.
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
  fprintf ( 1, 'CALPAK_TEST565\n' );
  fprintf ( 1, '  For the Republican calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_REPUBLICAN reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 6
    sy = y_to_s_republican ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_is_leap_republican ( y ) );
  end

  return
end