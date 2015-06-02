function calpak_test36 ( )

%*****************************************************************************80
%
%% CALPAK_TEST36 tests MONTH_LENGTH_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST36\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  MONTH_LENGTH_HEBREW returns month lengths.\n' );

  y_test(1) = 5760;
  y_test(2) = 5762;
  y_test(3) = 5765;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_hebrew ( y );
    months = year_length_months_hebrew ( y );
    days = year_length_hebrew ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y );
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days = %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_hebrew ( y, m );
      fprintf ( 1, '  %10s  %2d\n', month_name, month_length_hebrew ( y, m ) );
    end

  end
 
  return
end
