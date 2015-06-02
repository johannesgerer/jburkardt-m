function r8_log_2_test ( )

%*****************************************************************************80
%
%% R8_LOG_2_TEST tests R8_LOG_2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2014
%
%  Author:
%
%    John Burkardt
%
  test_num = 18;

  x_test = [ ...
    0.0,  1.0,  2.0,   3.0,  9.0, ...
   10.0, 11.0, 99.0, 101.0, -1.0, ...
   -2.0, -3.0, -9.0,   0.5,  0.33, ...
    0.25, 0.20, 0.01 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_LOG_2_TEST\n' );
  fprintf ( 1, '  R8_LOG_2 computes the logarithm base 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        R8_LOG_2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    x = x_test(test);
    fprintf ( 1, '  %12f  %12f\n', x, r8_log_2 ( x ) );
  end

  return
end
