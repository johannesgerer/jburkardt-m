function blas1_z_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests ZDSCAL.
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
  n = 6;

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  ZDSCAL multiplies a real scalar times a complex vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  da = 5.0;
  x = zdscal ( n, da, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = ZDSCAL ( N, %f, X, 1 )\n', da );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  da = -2.0;
  x = zdscal ( 3, da, x, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = ZDSCAL ( 3, %f, X, 2 )\n', da );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  return
end
