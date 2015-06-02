function calpak_test43 ( )

%*****************************************************************************80
%
%% CALPAK_TEST43 tests MONTH_TO_MONTH_NAME_REPUBLICAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST43\n' );
  fprintf ( 1, '  For the Republican calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_REPUBLICAN names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_republican ( y );

  for m = 1 : months
    month_name = month_to_month_name_republican ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end

  return
end
