function calpak_test503 ( )

%*****************************************************************************80
%
%% CALPAK_TEST503 tests WEEKDAY_TO_NAME_ISLAMIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST503\n' );
  fprintf ( 1, '  For the Islamic calendar,\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_ISLAMIC names the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s = weekday_to_name_islamic ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end
