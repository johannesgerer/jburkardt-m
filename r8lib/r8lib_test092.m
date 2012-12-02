function r8lib_test092 ( )

%*****************************************************************************80
%
%% TEST092 tests R8POLY_LAGRANGE_COEF and R8POLY_DERIV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  npol = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST092\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_COEF returns the coefficients\n' );
  fprintf ( 1, '    for a Lagrange basis polynomial.\n' );
  fprintf ( 1, '  R8POLY_DERIV computes derivatives of a polynomial.\n' );

  xpol = r8vec_indicator ( npol );

  r8vec_print ( npol, xpol, '  Abscissas:' );

  for ipol = 1 : npol

    pcof = r8poly_lagrange_coef ( npol, ipol, xpol );

    r8poly_print ( npol-1, pcof, '  The Lagrange basis polynomial:' );

    for d = 1 : npol-1
      pprime = r8poly_deriv ( npol-1, pcof, d );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The derivative of order %d\n', d );
      r8poly_print ( npol-1-d, pprime, ' ' );
    end

  end

  return
end
