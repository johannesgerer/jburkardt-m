function jacobi_polynomial_test03 ( )

%*****************************************************************************80
%
%% JACOBI_POLYNOMIAL_TEST03 tests J_QUADRATURE_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST03:\n' );
  fprintf ( 1, '  J_QUADRATURE_RULE computes the quadrature rule\n' );
  fprintf ( 1, '  associated with J(n,a,b,x);\n' );

  n = 7;
  a = 1.0;
  b = 2.5;
  [ x, w ] = j_quadrature_rule ( n, a, b );

  r8vec2_print ( n, x, w, '      X            W' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the quadrature rule to estimate:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Q = Integral (-1<x<+1) J(i,a,b,x) J(j,a,b,x) (1-x)^a (1+x)^b dx\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I   J      Q_Estimate         Q_Exact\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 5
    ji = j_polynomial ( n, i, a, b, x );
    for j = i : 5
      jj = j_polynomial ( n, j, a, b, x );
      f(1:n,1) = ji(1:n,i+1) .* jj(1:n,j+1);
      q = w' * f;
      q_exact = j_double_product_integral ( i, j, a, b );
      fprintf ( 1, '  %2d  %2d  %14g  %14g\n', i, j, q, q_exact );
    end
  end

  return
end
