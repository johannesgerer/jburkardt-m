function blas1_c_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests CSCAL.
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
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  CSCAL multiplies a complex scalar times a vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  da = 5.0 + 0.0 * i;
  x = cscal ( n, da, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CSCAL ( N, ( %f  %f), X, 1 )\n', real ( da ), imag ( da ) );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  da = -2.0 + 1.0 * i;
  x = cscal ( 3, da, x, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CSCAL ( 3, ( %f  %f), X, 2 )\n', real ( da ), imag ( da ) );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  return
end
