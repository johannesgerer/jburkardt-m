function blas1_d_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests DAXPY.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  DAXPY adds a multiple of vector X to vector Y.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  da = 1.0;
  y = daxpy ( n, da, x, 1, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DAXPY ( N, %f, X, 1, Y, 1 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  for i = 1 : n
    y(i) = 100 * i;
  end

  da = -2.0;
  y = daxpy ( n, da, x, 1, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DAXPY ( N, %f, X, 1, Y, 1 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  for i = 1 : n
    y(i) = 100 * i;
  end

  da = +3.0;
  y = daxpy ( 3, da, x, 2, y, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DAXPY ( 3, %f, X, 2, Y, 1 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  for i = 1 : n
    y(i) = 100 * i;
  end

  da = -4.0;
  y = daxpy ( 3, da, x, 1, y, 2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DAXPY ( 3, %f, X, 1, Y, 2 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, y(i) );
  end

  return
end
