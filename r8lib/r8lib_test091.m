function r8lib_test091 ( )

%*****************************************************************************80
%
%% TEST091 tests R8POLY_LAGRANGE_COEF.
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
  fprintf ( 1, 'TEST091\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_COEF returns the coefficients\n' );
  fprintf ( 1, '    for a Lagrange basis polynomial.\n' );
  fprintf ( 1, '  R8POLY_PRINT prints a polynomial.\n' );

  xpol = r8vec_indicator ( npol );

  r8vec_print ( npol, xpol, '  Abscissas:' );

  for ipol = 1 : npol

    pcof = r8poly_lagrange_coef ( npol, ipol, xpol );

    r8poly_print ( npol-1, pcof, '  The Lagrange basis polynomial:' );

  end

  return
end
