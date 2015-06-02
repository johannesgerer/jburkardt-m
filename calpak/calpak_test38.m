function calpak_test38 ( )

%*****************************************************************************80
%
%% CALPAK_TEST38 tests MONTH_NAME_TO_MONTH_COMMON
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 March 2013
%
%  Author:
%
%    John Burkardt
%
  ntest = 9;

  test(1,:) = 'J       ';
  test(2,:) = 'Febooary';
  test(3,:) = 'Dec.    ';
  test(4,:) = 'April   ';
  test(5,:) = 'Aug     ';
  test(6,:) = 'Mar     ';
  test(7,:) = 'May     ';
  test(8,:) = 'o       ';
  test(9,:) = 'nO      ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST38\n' );
  fprintf ( 1, '  For the Common calendar,\n' );
  fprintf ( 1, '  MONTH_NAME_TO_MONTH_COMMON identifies month names:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest
    m = month_name_to_month_common ( test(i,:) );
    month_name = month_to_month_name_common ( m );
    fprintf ( 1, '  %10s  %2d  %10s\n', test(i,:), m, month_name );
  end
 
  return
end