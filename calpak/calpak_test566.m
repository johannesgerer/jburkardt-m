function calpak_test566 ( )

%*****************************************************************************80
%
%% CALPAK_TEST566 tests YEAR_IS_LEAP_ROMAN.
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
  fprintf ( 1, 'CALPAK_TEST566\n' );
  fprintf ( 1, '  For the Roman calendar:\n' );
  fprintf ( 1, '  YEAR_IS_LEAP_ROMAN reports leap years.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Leap?\n' );
  fprintf ( 1, '\n' );

  for y = 96 : 100
    sy = y_to_s_roman ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_is_leap_roman ( y ) );
  end

  return
end