function r8poly_lagrange_1_test ( )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_1_TEST tests R8POLY_LAGRANGE_1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2014
%
%  Author:
%
%    John Burkardt
%
  npol = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8POLY_LAGRANGE_1_TEST\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_1 evaluates the Lagrange\n' );
  fprintf ( 1, '  factor W''(X) at a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of data points is %d\n', npol );
%
%  Set the abscissas of the polynomials.
%
  xlo = 0.0;
  xhi = npol - 1;

  xpol = r8vec_even ( npol, xlo, xhi );

  r8vec_print ( npol, xpol, '  Abscissas:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          W''(X)\n' );
  fprintf ( 1, '\n' );

  nx = 4 * npol - 1;

  for ival = 1 : nx

    xval = r8vec_even_select ( nx, xlo, xhi, ival );

    dwdx = r8poly_lagrange_1 ( npol, xpol, xval );

    fprintf ( 1, '%12f  %12e\n', xval, dwdx );

  end 

  return
end
