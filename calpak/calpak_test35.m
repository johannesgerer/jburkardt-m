function calpak_test35 ( )

%*****************************************************************************80
%
%% CALPAK_TEST35 tests MONTH_LENGTH_GREGORIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 March 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST35\n' );
  fprintf ( 1, '  For the Gregorian calendar:\n' );
  fprintf ( 1, '  MONTH_LENGTH_GREGORIAN returns month lengths.\n' );

  y_test(1) = 1582;
  y_test(2) = 1752;
  y_test(3) = 1900;
  y_test(4) = 2000;

  for i_test = 1 : n_test

    y = y_test(i_test);
    sy = y_to_s_gregorian ( y );
    months = year_length_months_gregorian ( y );
    days = year_length_gregorian ( y );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d\n', y );
    fprintf ( 1, '  %s\n', sy );
    fprintf ( 1, '  Year length in months = %d\n', months );
    fprintf ( 1, '  Year length in days = %d\n', days );
    fprintf ( 1, '\n' );

    for m = 1 : months
      month_name = month_to_month_name_common ( m );
      fprintf ( 1, '  %10s  %2d\n', month_name, month_length_gregorian ( y, m ) );
    end

  end

  return
end