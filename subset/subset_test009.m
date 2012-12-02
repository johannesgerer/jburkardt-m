function subset_test009 ( )

%*****************************************************************************80
%
%% TEST009 tests CHANGE_GREEDY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  coin_num = 6;
  coin_value = [ 1, 5, 10, 25, 50, 100 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST009\n' );
  fprintf ( 1, '  CHANGE_GREEDY makes change using the biggest\n' );
  fprintf ( 1, '  coins first.\n' );

  total = 73;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The total for which change is to be made: %d\n', total );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The available coins are:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : coin_num
    fprintf ( 1, '  %6d\n', coin_value(i) );
  end

  [ change_num, change ] = change_greedy ( total, coin_num, coin_value );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  ', change_num );
  for i = 1 : change_num
    fprintf ( 1, '  %3d', change(i) );
  end
  fprintf ( 1, '\n');

  total2 = sum ( coin_value(change(1:change_num) ) );

  fprintf ( 1, '  %4d  ', total2 );
  for i = 1 : change_num
    fprintf ( 1, '  %3d', coin_value(change(i)) );
  end
  fprintf ( 1, '\n');

  return
end
