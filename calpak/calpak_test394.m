function calpak_test394 ( )

%*****************************************************************************80
%
%% CALPAK_TEST394 tests MONTH_TO_MONTH_NAME_EG_CIVIL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST394\n' );
  fprintf ( 1, '  For the Egyptian Civil calendar,\n' );
  fprintf ( 1, '  MONTH_TO_MONTH_NAME_EG_CIVIL names the months.\n' );
  fprintf ( 1, '\n' );

  y = 1;
  months = year_length_months_eg_civil ( y );

  for m = 1 : months
    month_name = month_to_month_name_eg_civil ( m );
    fprintf ( 1, '  %2d  %s\n', m, month_name );
  end

  return
end
