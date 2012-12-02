function blas1_s_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests SROT.
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
    y(i) = i * i - 12;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  SROT carries out a Givens rotation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  c = 0.5;
  s = sqrt ( 1.0 - c * c );
  [ x, y ] = srot ( n, x, 1, y, 1, c, s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SROT ( N, X, 1, Y, 1, %f, %f )\n', c, s );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  for i = 1 : n
    x(i) = i;
  end

  for i = 1 : n
    y(i) = i * i - 12;
  end

  c = x(1) / sqrt ( x(1) * x(1) + y(1) * y(1) );
  s = y(1) / sqrt ( x(1) * x(1) + y(1) * y(1) );
  [ x, y ] = srot ( n, x, 1, y, 1, c, s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SROT ( N, X, 1, Y, 1, %f, %f )\n', c, s );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f  %12f\n', i, x(i), y(i) );
  end

  return
end
