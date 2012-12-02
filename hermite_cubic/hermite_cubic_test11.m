function hermite_cubic_test11 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST11 tests HERMITE_CUBIC_LAGRANGE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST11:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_LAGRANGE_VALUE evaluates the four\n' );
  fprintf ( 1, '  Lagrange basis functions associated with F1, D1,\n' );
  fprintf ( 1, '  F2 and D2 such that\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P(X) = F1 * LF1(X) + D1 * LD1(X)\n' );
  fprintf ( 1, '       + F2 * LF2(X) + D2 * LD2(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first, second and third derivatives of these four\n' );
  fprintf ( 1, '  Lagrange basis functions are also computed.\n' );
  fprintf ( 1, '\n' );

  x1 = 1.0;
  x2 = 2.0;
  n = 11;
  x = linspace ( 0.0, 2.5, n );

  [ f, d, s, t ] = hermite_cubic_lagrange_value ( x1, x2, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Lagrange basis functions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X           LF1         LD1         LF2         LD2\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %4d  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      j, x(j), f(1:4,j) )
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The derivative of the Lagrange basis functions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X           LF1         LD1         LF2         LD2\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %4d  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      j, x(j), d(1:4,j) )
  end

  return
end
