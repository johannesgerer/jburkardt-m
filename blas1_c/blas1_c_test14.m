function blas1_c_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests CSWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2006
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  for j = 1 : n
    y(j) = 20 * j + 2 * j * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  CSWAP swaps two complex vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), real ( y(j) ), imag ( y(j) ) );
  end

  [ x, y ] = cswap ( n, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  [ X, Y ] = CSWAP ( N, X, 1, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), real ( y(j) ), imag ( y(j) ) );
  end

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  for j = 1 : n
    y(j) = 20 * j + 2 * j * i;
  end

  [ x, y ] = cswap ( 3, x, 2, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  [ X, Y ] = CSWAP ( 3, X, 2, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), real ( y(j) ), imag ( y(j) ) );
  end

  return
end
