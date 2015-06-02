function r8poly_lagrange_2_test ( )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_2_TEST tests R8POLY_LAGRANGE_2.
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
  fprintf ( 1, 'R8POLY_LAGRANGE_2_TEST\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_2 evaluates the Lagrange\n' );
  fprintf ( 1, '  factor W"(X) at a point.\n' );
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
  fprintf ( 1, '      X          W"(X)\n' );
  fprintf ( 1, '\n' );

  nx = 4 * npol - 1;

  for ival = 1 : nx

    xval = r8vec_even_select ( nx, xlo, xhi, ival );
    dw2dx2 = r8poly_lagrange_2 ( npol, xpol, xval );

    fprintf ( 1, '%12f  %12e\n', xval, dw2dx2 );

  end 

  return
end
