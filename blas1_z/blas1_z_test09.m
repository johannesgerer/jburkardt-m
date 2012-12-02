function blas1_z_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests ZDOTU.
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
     2.0 - 1.0 * i, ...
    -4.0 - 2.0 * i, ...
     3.0 + 1.0 * i, ...
     2.0 + 2.0 * i, ...
    -1.0 - 1.0 * i ];
  y = [ ...
    -1.0 + 0.0 * i, ...
     0.0 - 3.0 * i, ...
     4.0 + 0.0 * i, ...
    -3.0 + 4.0 * i, ...
    -2.0 + 0.0 * i ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  ZDOTU computes the unconjugated dot product of\n' );
  fprintf ( 1, '  two complex vectors.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X =\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  x_norm = zdotu ( n, x, 1, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The unconjugated dot product ( X dot X )\n' );
  fprintf ( 1, '  (which is NOT the square of the norm of X!):\n' );
  fprintf ( 1, '  ZDOTU(X,X) = %f  %f\n', x_norm );

  xy_dot = zdotu ( n, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X =\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dot product ( X dot Y ) is %f  %f\n', xy_dot );

  return
end
