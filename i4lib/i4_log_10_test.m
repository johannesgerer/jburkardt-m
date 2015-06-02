function i4_log_10_test ( )

%*****************************************************************************80
%
%% I4_LOG_10_TEST tests I4_LOG_10.
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
  n = 13;

  x = [ 0, 1, 2, 3, 9, 10, 11, 99, 101, -1, -2, -3, -9 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_LOG_10_TEST\n' );
  fprintf ( 1, '  I4_LOG_10: whole part of log base 10,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, I4_LOG_10\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n

    fprintf ( 1, '%6d  %12d\n', x(i), i4_log_10 ( x(i) ) );

  end

  return
end
