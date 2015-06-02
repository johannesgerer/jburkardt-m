function calpak_test495 ( )

%*****************************************************************************80
%
%% CALPAK_TEST495 tests WEEKDAY_TO_NAME_BAHAI.
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
  fprintf ( 1, 'CALPAK_TEST495\n' );
  fprintf ( 1, '  For the Bahai calendar:\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_BAHAI names the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s = weekday_to_name_bahai ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end