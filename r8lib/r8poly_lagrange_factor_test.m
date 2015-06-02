function r8poly_lagrange_factor_test ( )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_FACTOR_TEST tests R8POLY_LAGRANGE_FACTOR.
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
  fprintf ( 1, 'R8POLY_LAGRANGE_FACTOR_TEST\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_FACTOR evaluates the Lagrange\n' );
  fprintf ( 1, '  factor W(X) at a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this test, we use %d functions.\n', npol );
%
%  Set the abscissas of the polynomials.
%
  xlo = 0.0;
  xhi = npol - 1;

  for i = 1 : npol
    xpol(i) = ( ( npol - ( i - 1 ) ) * xlo ...
              + (        ( i - 1 ) ) * xhi ) ...
              / ( npol             );
  end
 
  r8vec_print ( npol, xpol, '  Abscissas:' );
%
%  Evaluate W(X) and W'(X).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          W(X)          W''(X)\n' );
  fprintf ( 1, '\n' );
  
  for i = 0 : 2 * npol - 1

    xval = r8vec_even_select ( 2 * npol - 1, xhi, xlo, i );
 
    [ wval, dwdx ] = r8poly_lagrange_factor ( npol, xpol, xval );
 
    fprintf ( 1, '  %10f  %10f  %10f\n', xval, wval, dwdx );

  end
 
  return
end
