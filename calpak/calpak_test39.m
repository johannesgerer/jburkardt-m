function calpak_test39 ( )

%*****************************************************************************80
%
%% CALPAK_TEST39 tests MONTH_TO_MONTH_NAME_COMMON.
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
  fprintf ( 1, 'CALPAK_TEST39\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_COMMON names the months:\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_common ( y );

  for m = 1 : months
    month_name = month_to_month_name_common ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end

  return
end