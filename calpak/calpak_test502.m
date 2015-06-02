function calpak_test502 ( )

%*****************************************************************************80
%
%% CALPAK_TEST502 tests WEEKDAY_TO_NAME_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST502\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_HEBREW names the days of the week.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s = weekday_to_name_hebrew ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end
