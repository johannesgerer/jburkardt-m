function jacobi_polynomial_test04 ( )

%*****************************************************************************80
%
%% JACOBI_POLYNOMIAL_TEST04 tests J_DOUBLE_PRODUCT_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST04:\n' );
  fprintf ( 1, '  J_DOUBLE_PRODUCT_INTEGRAL computes the weighted integral of\n' );
  fprintf ( 1, '  J(i,a,b,x) * J(j,a,b,x);\n' );

  a = 1.0;
  b = 2.5;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this example, we use a = %f, b = %f\n', a, b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Q = Integral (-1<x<+1) J(i,a,b,x) J(j,a,b,x) (1-x)^a (1+x)^b dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J      Q\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 5
    for j = i : 5
      q = j_double_product_integral ( i, j, a, b );
      fprintf ( 1, '  %2d  %2d  %14g\n', i, j, q );
    end
  end

  return
end
