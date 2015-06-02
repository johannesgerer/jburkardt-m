function calpak_test389 ( )

%*****************************************************************************80
%
%% CALPAK_TEST389 tests MONTH_TO_MONTH_NAME_BAHAI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST389\n' );
  fprintf ( 1, '  For the Bahai calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_BAHAI names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_bahai ( y );

  for m = 1 : months
    month_name = month_to_month_name_bahai ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end

  return
end
