function hermite_cubic_test13 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST13 tests HERMITE_CUBIC_LAGRANGE_INTEGRATE.
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
  fprintf ( 1, 'HERMITE_CUBIC_TEST13:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_LAGRANGE_INTEGRATE integrates a Hermite cubic\n' );
  fprintf ( 1, '  Lagrange polynomial from A to B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute each result TWICE:\n' );
  fprintf ( 1, '  First row computed using HERMITE_CUBIC_INTEGRATE.\n' );
  fprintf ( 1, '  Second row computed using HERMITE_CUBIC_LAGRANGE_INTEGRATE.\n' );

  x1 = 0.0;
  x2 = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '        A           B           LF1         LD1         LF2         LD2\n' );
  fprintf ( 1, '\n' );

  a = x1 - 1.0;

  for j = - 3 : 12

    b = ( ( 10 - j ) * x1   ...
        +        j   * x2 ) ...
        /   10.0;

    p(1) = hermite_cubic_integrate ( x1, 1.0, 0.0, x2, 0.0, 0.0, a, b );
    p(2) = hermite_cubic_integrate ( x1, 0.0, 1.0, x2, 0.0, 0.0, a, b );
    p(3) = hermite_cubic_integrate ( x1, 0.0, 0.0, x2, 1.0, 0.0, a, b );
    p(4) = hermite_cubic_integrate ( x1, 0.0, 0.0, x2, 0.0, 1.0, a, b );

    q = hermite_cubic_lagrange_integrate ( x1, x2, a, b );

    fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      a, b, p(1:4) );
    fprintf ( 1, '                          %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      q(1:4) );

  end

  return
end
