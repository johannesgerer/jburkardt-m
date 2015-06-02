function calpak_test42 ( )

%*****************************************************************************80
%
%% CALPAK_TEST42 tests MONTH_TO_MONTH_NAME_ISLAMIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST42\n' );
  fprintf ( 1, '  For the Islamic calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_ISLAMIC names the months:\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_islamic ( y );

  for m = 1 : months
    month_name = month_to_month_name_islamic ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end
 
  return
end
