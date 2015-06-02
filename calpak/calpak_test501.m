function calpak_test501 ( )

%*****************************************************************************80
%
%% CALPAK_TEST501 tests WEEKDAY_TO_NAME_GERMAN.
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
  fprintf ( 1, 'CALPAK_TEST501\n' );
  fprintf ( 1, '  For the German calendar,\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_GERMAN names the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s = weekday_to_name_german ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end