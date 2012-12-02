function r8lib_test093 ( )

%*****************************************************************************80
%
%% TEST093 tests R8POLY_LAGRANGE_0, R8POLY_LAGRANGE_1 and R8POLY_LAGRANGE_2.
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
  fprintf ( 1, 'TEST093\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_0 evaluates the Lagrange\n' );
  fprintf ( 1, '    factor W(X) at a point.\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_1 evaluates the Lagrange\n' );
  fprintf ( 1, '    factor W''(X) at a point.\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_2 evaluates the Lagrange\n' );
  fprintf ( 1, '    factor W"(X) at a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data points is %d\n', npol );
%
%  Set the abscissas of the polynomials.
%
  xlo = 0.0;
  xhi = npol - 1;

  xpol = r8vec_even ( npol, xlo, xhi );

  r8vec_print ( npol, xpol, '  Abscissas:' );
%
%  Evaluate W(X), W'(X), W''.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          W(X)          W''(X)        W"(X)\n' );
  fprintf ( 1, '\n' );

  nx = 4 * npol - 1;

  for ival = 1 : nx

    xval = r8vec_even_select ( nx, xlo, xhi, ival );

    w = r8poly_lagrange_0 ( npol, xpol, xval );
    dwdx = r8poly_lagrange_1 ( npol, xpol, xval );
    dw2dx2 = r8poly_lagrange_2 ( npol, xpol, xval );

    fprintf ( 1, '%12f  %12e  %12e  %12e\n', xval, w, dwdx, dw2dx2 );

  end 

  return
end
