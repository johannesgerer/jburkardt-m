function calpak_test365 ( )

%*****************************************************************************80
%
%% CALPAK_TEST365 tests MONTH_LENGTH_ISLAMIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 March 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST365\n' );
  fprintf ( 1, '  For the Islamic calendar,\n' );
  fprintf ( 1, '  MONTH_LENGTH_ISLAMIC returns month lengths.\n' );

  y_test(1) = 500;
  y_test(2) = 501;
  y_test(3) = 502;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_islamic ( y );
    months = year_length_months_islamic ( y );
    days = year_length_islamic ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y );
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days = %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_islamic ( m );
      fprintf ( 1, '  %10s  %2d\n', month_name, month_length_islamic ( y, m ) );
    end

  end
 
  return
end