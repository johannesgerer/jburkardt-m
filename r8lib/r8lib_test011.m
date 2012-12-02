function r8lib_test011 ( )

%*****************************************************************************80
%
%% TEST011 tests R8_LOG_B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  b_test = [ ...
    2.0, 3.0, 4.0, 5.0, 6.0, ...
    7.0, 8.0, 16.0, 32.0, 256.0 ];

  x = 16.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST011\n' );
  fprintf ( 1, '  R8_LOG_B computes the logarithm base B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, B, R8_LOG_B\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    b = b_test(test);

    fprintf ( 1, '  %12f  %12f  %12f\n', x, b, r8_log_b ( x, b ) );

  end

  return
end
