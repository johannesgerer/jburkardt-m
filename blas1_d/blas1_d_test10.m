function blas1_d_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests DSWAP.
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
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  DSWAP swaps two vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  [ x, y ] = dswap ( n, x, 1, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DSWAP ( N, X, 1, Y, 1 )\n' );
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

  [ x, y ] = dswap ( 3, x, 2, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DSWAP ( 3, X, 2, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  return
end
