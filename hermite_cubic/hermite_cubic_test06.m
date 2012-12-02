function hermite_cubic_test06 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST06 tests HERMITE_CUBIC_INTEGRATE using vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST06:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_INTEGRATE integrates a Hermite cubic\n' );
  fprintf ( 1, '  polynomial from A to B.\n' );
  fprintf ( 1, '  Use A, B vectors for the calculation.\n' );

  x1 = 0.0;
  x2 = 10.0;

  [ f1, d1, s1, t1 ] = cubic_value ( x1 );
  [ f2, d2, s2, t2 ] = cubic_value ( x2 );
%
%  A is a scalar, but B is a vector.
%
  a = x1 - 1.0;
  b = linspace ( ( 13 * x1 - 3 * x2 ) / 10, ( -2 * x1 + 12 * x2 ) / 10, 16 );
  b = b ( : );

  q_exact = cubic_integrate ( a, b );
  q_computed = hermite_cubic_integrate ( x1, f1, d1, x2, f2, d2, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                                 Exact       Computed\n' );
  fprintf ( 1, '    J      A           B         Integral    Integral\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 16

    fprintf ( 1, '  %3d  %10f  %10f  %10.6g  %10.6g\n', ...
        i, a, b(i), q_exact(i), q_computed(i) );

  end

  return
end
