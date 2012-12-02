function hermite_cubic_test12 ( )

%*****************************************************************************80
%
%% HERMITE_CUBIC_TEST12 tests HERMITE_CUBIC_LAGRANGE_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_CUBIC_TEST12:\n' );
  fprintf ( 1, '  HERMITE_CUBIC_LAGRANGE_INTEGRAL returns the integrals\n' );
  fprintf ( 1, '  of the four Lagrange basis functions associated \n' );
  fprintf ( 1, '  with F1, D1, F2 and D2 such that\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P(X) = F1 * LF1(X) + D1 * LD1(X)\n' );
  fprintf ( 1, '       + F2 * LF2(X) + D2 * LD2(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Lagrange basis function integrals:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X1          X2          LF1         LD1         LF2         LD2\n' );
  fprintf ( 1, '\n' );

  x2 = 1.0;
  for x1 = -6 : +2
    q = hermite_cubic_lagrange_integral ( x1, x2 );
    fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', ...
      x1, x2, q(1:4) )
  end

  return
end
