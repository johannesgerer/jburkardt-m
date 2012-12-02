function subset_test026a ( )

%*****************************************************************************80
%
%% TEST026a tests DIOPHANTINE_SOLUTION_MINIMIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026a\n' );
  fprintf ( 1, '  DIOPHANTINE_SOLUTION_MINIMIZE computes a minimal\n' );
  fprintf ( 1, '  Euclidean norm solution of a Diophantine equation:\n' );
  fprintf ( 1, '    A * X + B * Y = C\n' );

  a = 4096;
  b = -15625;
  c = 46116;
  x = 665499996;
  y = 174456828;

  r = a * x + b * y - c;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coefficients:\n' );
  fprintf ( 1, '    A = %12d\n', a );
  fprintf ( 1, '    B = %12d\n', b );
  fprintf ( 1, '    C = %12d\n', c );
  fprintf ( 1, '  Solution:\n' );
  fprintf ( 1, '    X = %12d\n', x );
  fprintf ( 1, '    Y = %12d\n', y );
  fprintf ( 1, '  Residual R = A * X + B * Y - C:\n' );
  fprintf ( 1, '    R = %12d\n', r );

  [ x, y ] = diophantine_solution_minimize ( a, b, x, y );

  r = a * x + b * y - c;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The minimized solution:\n' );
  fprintf ( 1, '    X = %12d\n', x );
  fprintf ( 1, '    Y = %12d\n', y );
  fprintf ( 1, '  Residual R = A * X + B * Y - C:\n' );
  fprintf ( 1, '    R = %12d\n', r );

  x = 15621;
  y = 4092;

  r = a * x + b * y - c;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The minimal positive solution:\n' );
  fprintf ( 1, '    X = %12d\n', x );
  fprintf ( 1, '    Y = %12d\n', y );
  fprintf ( 1, '  Residual R = A * X + B * Y - C:\n' );
  fprintf ( 1, '    R = %12d\n', r );

  return
end
