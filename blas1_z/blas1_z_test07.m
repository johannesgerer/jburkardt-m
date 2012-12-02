function blas1_z_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests ZCOPY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  ZCOPY copies one complex vector into another.\n' );

  for j = 1 : 10
    x(j) = 10 * j + j * i;
  end

  for j = 1 : 10
    y(j) = 20 * j + 2 * j * i;
  end

  for j = 1 : 5
    for k = 1 : 5
      a(j,k) = 10 * j + k * i;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %6d  %12f  %12f\n', j, real ( x(j) ), imag ( x(j) ) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y =\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %6d  %12f  %12f\n', j, real ( y(j) ), imag ( y(j) ) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : 5
    for k = 1 : 5
      fprintf ( 1, '  %10f%10f', real ( a(j,k) ), imag ( a(j,k) ) );
    end
    fprintf ( 1, '\n' );
  end

  y = zcopy ( 5, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = ZCOPY ( 5, X, 1, Y, 1 )\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %6d  %12f  %12f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  for j = 1 : 10
    y(j) = 20 * j + 2 * j * i;
  end

  y = zcopy ( 3, x, 2, y, 3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = ZCOPY ( 3, X, 2, Y, 3 )\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 10
    fprintf ( 1, '  %6d  %12f  %12f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  a(1:5,1) = zcopy ( 5, x, 1, a(1:5,1), 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(1:5,1) = ZCOPY ( 5, X, 1, A(1:5,1), 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : 5
    for k = 1 : 5
      fprintf ( 1, '  %10f%10f', real ( a(j,k) ), imag ( a(j,k) ) );
    end
    fprintf ( 1, '\n' );
  end

  for j = 1 : 5
    for k = 1 : 5
      a(j,k) = 10 * j + k * i;
    end
  end

  a(1,1:5) = zcopy ( 5, x, 2, a(1,1:5), 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A(1,1:5) = ZCOPY ( 5, X, 2, A(1,1:5), 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A =\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 5
    for k = 1 : 5
      fprintf ( 1, '  %10f%10f', real ( a(j,k) ), imag ( a(j,k) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end

