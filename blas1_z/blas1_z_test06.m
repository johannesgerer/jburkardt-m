function blas1_z_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests ZAXPY.
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
  n = 5;

  x = [ ...
      2.0 -1.0 * i, ...
     -4.0 -2.0 * i, ...
      3.0  1.0 * i, ...
      2.0  2.0 * i, ...
     -1.0 -1.0 * i ];
  y = [ ...
     -1.0,  0.0 * i, ...
      0.0, -3.0 * i, ...
      4.0,  0.0 * i, ...
     -3.0,  4.0 * i, ...
     -2.0,  0.0 * i ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  ZAXPY adds a multiple of one complex vector to another.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  s = 0.50 - 1.00 * i;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The scalar multiplier is: ( %f  %f )\n', ...
    real ( s ), imag ( s ) );

  y = zaxpy ( n, s, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A * X + Y = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  return
end
