function subset_test0327 ( )

%*****************************************************************************80
%
%% TEST0327 tests I4_LOG_10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 21;
  x = [   0,    1,    2,  3,  9, 10, 11,  99, 100, 101, ...
        999, 1000, 1001, -1, -2, -3, -9, -10, -11, -99, ...
       -101 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0327\n' );
  fprintf ( 1, '  I4_LOG_10: whole part of log base 10,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X, I4_LOG_10\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n

    fprintf ( 1, '  %4d  %10d\n', x(i), i4_log_10 ( x(i) ) );

  end

  return
end
