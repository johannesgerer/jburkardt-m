function calpak_test40 ( )

%*****************************************************************************80
%
%% CALPAK_TEST40 tests MONTH_TO_MONTH_NAME_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST40\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_HEBREW names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_hebrew ( y );

  for i = 1 : months
    m = i;
    month_name = month_to_month_name_hebrew ( y, m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end
 
  return
end
