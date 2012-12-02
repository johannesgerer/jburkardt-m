function quadrule_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests CLENSHAW_CURTIS_RULE_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2007
%
%  Author:
%
%    John Burkardt
%
  order_max = 16;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  CLENSHAW_CURTIS_RULE_COMPUTE computes a Clenshaw-Curtis rule;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [-1,1].\n' );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Order          F1              F2              F3\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_max

    [ xtab, weight ] = clenshaw_curtis_rule_compute ( order );

    result(1) = 0.0;
    for i = 1 : order
      result(1) = result(1) + weight(i) * f1 ( xtab(i) );
    end

    result(2) = 0.0;
    for i = 1 : order
      result(2) = result(2) + weight(i) * f2 ( xtab(i) );
    end

    result(3) = 0.0;
    for i = 1 : order
      result(3) = result(3) + weight(i) * f3 ( xtab(i) );
    end

    fprintf ( 1, '  %6d  %14f  %14f  %14f\n', order, result(1:3) );

  end

  fprintf ( 1, '\n' );

  result(1) = 46.0 * sinh ( 1.0 ) / 25.0 - 2.0 * sin ( 1.0 );
  result(2) = 1.5822329637296729331;
  result(3) = ( sqrt ( 2.0 ) + 3.0 * sqrt ( 6.0 ) ) / 6.0;

  fprintf ( 1, '  Exact   %14f  %14f  %14f\n', result(1:3) );

  return
end
