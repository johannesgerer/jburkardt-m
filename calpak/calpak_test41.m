function calpak_test41 ( )

%*****************************************************************************80
%
%% CALPAK_TEST41 tests MONTH_TO_MONTH_NAME_HINDU_LUNAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST41\n' );
  fprintf ( 1, '  For the Hindu lunar calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_HINDU_LUNAR names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_hindu_lunar ( y );

  for m = 1 : months
    month_name = month_to_month_name_hindu_lunar ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end
 
  return
end