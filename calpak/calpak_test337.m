function calpak_test337 ( )

%*****************************************************************************80
%
%% CALPAK_TEST337 tests MONTH_EG_LUNAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 March 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST337\n' );
  fprintf ( 1, '  For the Egyptian Lunar calendar,\n' );
  fprintf ( 1, '  MONTH_LENGTH_EG_LUNAR returns month lengths.\n' );

  y_test(1) = 1;
  y_test(2) = 2;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_eg_lunar ( y );
    months = year_length_months_eg_lunar ( y );
    days = year_length_eg_lunar ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y );
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days = %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_eg_lunar ( m );
      fprintf ( 1, '  %10s  %2d\n', month_name, month_length_eg_lunar ( y, m ) );
    end

  end
 
  return
end