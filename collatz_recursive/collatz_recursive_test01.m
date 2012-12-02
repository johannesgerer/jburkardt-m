function collatz_recursive_test01 ( )

%*****************************************************************************80
%
%% COLLATZ_RECURSIVE_TEST01 tests COLLATZ_PATH;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;
  n_test(1:test_num) = [ 7, 8, 9, 10, 600 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_RECURSIVE_TEST01\n' );
  fprintf ( 1, '  COLLATZ_PATH prints the members of a Collatz path.\n' );

  for test = 1 : test_num
    n = n_test(test);
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d is the starting point.\n', n );
    collatz_path ( n );
  end

  return
end
