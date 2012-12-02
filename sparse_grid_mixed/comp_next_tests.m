function comp_next_tests ( )

%****************************************************************************80
%
%% COMP_NEXT_TESTS calls COMP_NEXT_TEST with various arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../sandia_rules' );

  test_num = 12;

  dim_num_array(1:test_num) = [ ...
    2, 2, 2, 2, 2, ...
    3, 3, 3, 3, 3, ...
    4, 4 ];
  level_max_array(1:test_num) = [ ...
    0, 1, 2, 3, 4, ...
    0, 1, 2, 3, 4, ...
    2, 3 ];

  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP_NEXT_TESTS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Call COMP_NEXT_TEST with various arguments.\n' );

  for test = 1 : test_num

    dim_num = dim_num_array(test);
    level_max = level_max_array(test);
    comp_next_test ( dim_num, level_max );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMP__NEXT_TESTS\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
