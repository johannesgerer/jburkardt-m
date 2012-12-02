function quadrule_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests LEGENDRE_SET_X2, LEGENDRE_SET_X2_01 and RULE_ADJUST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  norder = 5;

  a = -1.0;
  b = +1.0;
  c =  0.0;
  d =  1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  LEGENDRE_SET_X2 sets up Gauss-Legendre quadrature\n' );
  fprintf ( 1, '    for integrating ( 1 + X )^2 * F(X) over [-1,1];\n' );
  fprintf ( 1, '  RULE_ADJUST adjusts a rule for a new interval.\n' );
  fprintf ( 1, '  LEGENDRE_SET_X2_01 sets up Gauss-Legendre quadrature\n' );
  fprintf ( 1, '    for integrating X^2 * F(X) over [0,1];\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will use LEGENDRE_SET_X2 to get a rule for [-1,1],\n' );
  fprintf ( 1, '  adjust it to [0,1] using RULE_ADJUST,\n' );
  fprintf ( 1, '  make further adjustments because the weight function\n' );
  fprintf ( 1, '  is not 1,\n' );
  fprintf ( 1, '  and compare the results of LEGENDRE_SET_X2_01.\n' );
  fprintf ( 1, '\n' );

  [ xtab1, weight1 ] = legendre_set_x2 ( norder );

  xtab2(1:norder) = xtab1(1:norder);
  weight2(1:norder) = weight1(1:norder);

  [ xtab2, weight2 ] = rule_adjust ( a, b, c, d, norder, xtab2, weight2 );
%
%  Because the weight function W(X) is not 1, we need to do more
%  adjustments to the weight vector.
%
  weight2(1:norder) = weight2(1:norder) / 4.0;

  [ xtab3, weight3 ] = legendre_set_x2_01 ( norder );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Abscissas:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original  Adjusted Stored\n' );
  fprintf ( 1, '\n' );

  for i = 1 : norder
    fprintf ( 1, '  %2d  %16f  %16f  %16f\n', ...
      i, xtab1(i), xtab2(i), xtab3(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weights:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original  Adjusted Stored\n' );
  fprintf ( 1, '\n' );

  for i = 1 : norder
    fprintf ( 1, '  %2d  %16f  %16f  %16f\n', ...
      i, weight1(i), weight2(i), weight3(i) );
  end

  return
end
