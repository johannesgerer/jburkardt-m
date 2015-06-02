function calpak_test515 ( )

%*****************************************************************************80
%
%% CALPAK_TEST515 tests WEEKDAY_TO_NAME_ROMAN.
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
  fprintf ( 1, 'CALPAK_TEST515\n' );
  fprintf ( 1, '  WEEKDAY_TO_NAME_ROMAN names the days of \n' );
  fprintf ( 1, '  the week in the Roman calendar.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 7
    s = weekday_to_name_roman ( i );
    fprintf ( 1, '  %2d  %s\n', i, s );
  end

  return
end
