function calpak_test375 ( )

%*****************************************************************************80
%
%% CALPAK_TEST375 tests MONTH_LENGTH_REPUBLICAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 March 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST375\n' );
  fprintf ( 1, '  For the Republican calendar:\n' );
  fprintf ( 1, '  MONTH_LENGTH_REPUBLICAN returns month lengths.\n' );

  y_test(1) = 4;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_republican ( y );
    months = year_length_months_republican ( y );
    days = year_length_republican ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y );
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days = %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_republican ( m );
      fprintf ( 1, '  %10s  %2d\n', month_name, month_length_republican ( y, m ) );
    end

  end

  return
end