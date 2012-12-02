function blas1_s_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests SSWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  for i = 1 : n
    x(i) = i;
  end

  for i = 1 : n
    y(i) = 100 * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  SSWAP swaps two vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  [ x, y ] = sswap ( n, x, 1, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SSWAP ( N, X, 1, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  for i = 1 : n
    x(i) = i;
  end

  for i = 1 : n
    y(i) = 100 * i;
  end

  [ x, y ] = sswap ( 3, x, 2, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SSWAP ( 3, X, 2, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  return
end
