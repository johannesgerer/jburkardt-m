function change_making_test02 ( )

%*****************************************************************************80
%
%% CHANGE_MAKING_TEST02 uses CHANGE_MAKING_LIST on the problems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHANGE_MAKING_TEST02:\n' );
  fprintf ( 1, '  CHANGE_MAKING LIST computes A(T), the smallest number \n' );
  fprintf ( 1, '  of coins needed to form a given sum T, by computing \n' );
  fprintf ( 1, '  the list A(1) through A(T).\n' );

  test_num = 7;

  coin_num_list = [ ...
    3, ...
    5, ...
    6, ...
    7, ...
    3, ...
    6, ...
    3 ];
  coin_value_list = { ...
    [  5,  9, 13 ], ...
    [  1,  4,  5,  8, 11 ], ...
    [  1,  5, 10, 25, 50, 100 ], ...
    [  1,  2,  6, 12, 24,  48,  60 ], ...
    [  1,  3,  4 ], ...
    [ 16, 17, 23, 24, 39,  40 ], ...
    [  6,  9, 20 ] };
  target_list = [ ...
    19, ...
    29, ...
    96, ...
    96, ...
     6, ...
   100, ...
    43 ];

  for test = 1 : test_num

    coin_num = coin_num_list(test);
    coin_value = coin_value_list{test};
    target = target_list(test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test %d:\n', test );
    fprintf ( 1, '  Number of coins = %d\n', coin_num );
    fprintf ( 1, '  Values = ' );
    for i = 1 : coin_num
      fprintf ( 1, '  %d', coin_value(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Target = %d\n', target );

    a = change_making_list ( coin_num, coin_value, target );

    fprintf ( 1, '\n' );
    for i = 1 : target
      if ( a == Inf )
        fprintf ( 1, '  %3d  Not possible!\n' );
      else
        fprintf ( 1, '  %3d  %2d\n', i, a(i) );
      end
    end

  end

  coin_num = 3;
  coin_value = [ 5, 9, 13 ];
  target = 19;


  return
end

