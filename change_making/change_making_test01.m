function change_making_test01 ( )

%*****************************************************************************80
%
%% CHANGE_MAKING_TEST01 lists the problem data.
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
  fprintf ( 1, 'CHANGE_MAKING_TEST01:\n' );
  fprintf ( 1, '  List the problem data.\n' );

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

  end

  return
end

