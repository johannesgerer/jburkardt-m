function i4_log_2_test ( )

%*****************************************************************************80
%
%% I4_LOG_2_TEST tests I4_LOG_2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 17;

  x_test = [ 0, 1, 2, 3, 9, 10, 11, 99, 101, -1, -2, ...
    -3, -9, 1000, 1023, 1024, 1025 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_LOG_2_TEST\n' );
  fprintf ( 1, '  I4_LOG_2: whole part of log base 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X     I4_LOG_2\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    x = x_test(test);
    fprintf ( 1, '  %6d  %12d\n', x, i4_log_2 ( x ) );
  end

  return
end
