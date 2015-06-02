function calpak_test328 ( )

%*****************************************************************************80
%
%% CALPAK_TEST328 tests MONTH_LENGTH_BAHAI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 March 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST328\n' );
  fprintf ( 1, '  For the Bahai calendar:\n' );
  fprintf ( 1, '  MONTH_LENGTH_BAHAI returns month lengths.\n' );

  y_test(1) = 60;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_bahai ( y );
    months = year_length_months_bahai ( y );
    days = year_length_bahai ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y )
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days =   %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_bahai ( m );
      fprintf ( 1, '  %10s  %d\n', month_name, month_length_bahai ( y, m ) );
    end

  end
 
  return
end
