function r8poly_lagrange_coef_test ( )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_COEF_TEST tests R8POLY_LAGRANGE_COEF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
  npol = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_LAGRANGE_COEF_TEST\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_COEF returns the coefficients\n' );
  fprintf ( 1, '  for a Lagrange basis polynomial.\n' );

  xpol = r8vec_indicator1 ( npol );

  r8vec_print ( npol, xpol, '  Abscissas:' );

  for ipol = 1 : npol

    pcof = r8poly_lagrange_coef ( npol, ipol, xpol );

    r8poly_print ( npol-1, pcof, '  The Lagrange basis polynomial:' );

  end

  return
end
