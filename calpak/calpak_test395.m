function calpak_test395 ( )

%*****************************************************************************80
%
%% CALPAK_TEST395 tests MONTH_TO_MONTH_NAME_GREEK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST395\n' );
  fprintf ( 1, '  For the Greek calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_GREEK names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_greek ( y );

  for i = 1 : months
    m = i;
    month_name = month_to_month_name_greek ( y, m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end
 
  return
end