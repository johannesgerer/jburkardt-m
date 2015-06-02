function r8poly_lagrange_val_test ( )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_VAL_TEST tests R8POLY_LAGRANGE_VAL.
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
  fprintf ( 1, 'R8POLY_LAGRANGE_VAL_TEST\n' );
  fprintf ( 1, '  R8POLY_LAGRANGE_VAL evaluates a Lagrange\n' );
  fprintf ( 1, '  interpolating polynomial at a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data points = %d\n', npol );
%
%  Set the abscissas of the polynomials.
%
  xlo = 0.0;
  xhi = npol - 1;
  xpol = r8vec_even ( npol, xlo, xhi );
 
  r8vec_print ( npol, xpol, '  Abscissas:' );
%
%  Evaluate the polynomials.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here are the values of the functions at\n' );
  fprintf ( 1, '  several points:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          L1          L2          L3      L4' );
  fprintf ( 1, '          L5\n' );
  fprintf ( 1, '\n' );
 
  nx = 2 * npol - 1;
 
  for ival = 1 : nx
 
    xval = r8vec_even_select ( nx, xlo, xhi, ival );
 
    for ipol = 1 : npol
      [ pval(ipol), dpdx(ipol) ] = ...
        r8poly_lagrange_val ( npol, ipol, xpol, xval );
    end
 
    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      xval, pval(1:npol) );
 
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  And the derivatives:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          L''1         L''2         L''3' );
  fprintf ( 1, '     L''4         L''5\n' );
  fprintf ( 1, '\n' );
 
  nx = 2 * npol - 1;
 
  for ival = 1 : nx
 
    xval = r8vec_even_select ( nx, xlo, xhi, ival );
 
    for ipol = 1 : npol
      [ pval(ipol), dpdx(ipol) ] = ...
        r8poly_lagrange_val ( npol, ipol, xpol, xval );
    end
 
    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      xval, dpdx(1:npol) );
 
  end

  return
end
