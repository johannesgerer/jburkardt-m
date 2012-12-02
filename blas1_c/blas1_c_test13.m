function blas1_c_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests CSSCAL.
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
  n = 6;

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  CSSCAL multiplies a real scalar times a complex vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  da = 5.0;
  x = csscal ( n, da, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = CSSCAL ( N, %f, X, 1 )\n', da );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  da = -2.0;
  x = csscal ( 3, da, x, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = CSSCAL ( 3, %f, X, 2 )\n', da );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  return
end
