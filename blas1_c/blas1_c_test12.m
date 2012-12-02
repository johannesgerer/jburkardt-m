function blas1_c_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests CSROT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2006
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  for j = 1 : n
    x(j) = 10 * j + j * i;
  end

  for j = 1 : n
    y(j) = 20 * j + 2 * j * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  CSROT carries out a Givens rotation\n' );
  fprintf ( 1, '  on a complex vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X and Y\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), real ( y(j) ), imag ( y(j) ) );
  end

  c = 0.5;
  s = sqrt ( 1.0 - c * c );
  [ x, y ] = csrot ( n, x, 1, y, 1, c, s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CSROT ( N, X, 1, Y, 1, %f, %f )\n', c, s );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), real ( y(j) ), imag ( y(j) ) );
  end

  return
end
