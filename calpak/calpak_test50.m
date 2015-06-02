function calpak_test50 ( )

%*****************************************************************************80
%
%% CALPAK_TEST50 tests WEEKDAY_TO_NAME_COMMON, WEEKDAY_TO_NAME_COMMON2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST50\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_COMMON names the days of the week,\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_COMMON2 abbreviates the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s1 = weekday_to_name_common ( i );
    s2 = weekday_to_name_common2 ( i );
    fprintf ( 1, '  %2d  %10s  %10s\n', i, s1, s2 );
  end

  return
end