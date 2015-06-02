function calpak_test51 ( )

%*****************************************************************************80
%
%% CALPAK_TEST51 tests WEEKDAY_TO_NAME_REPUBLICAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST51\n' );
  fprintf ( 1, '  For the Republican calendar,\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_REPUBLICAN names the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    s = weekday_to_name_republican ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end
