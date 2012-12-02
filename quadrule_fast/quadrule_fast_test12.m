function quadrule_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests FEJER2_INTEGRATE_FAST.
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
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  FEJER2_INTEGRATE_FAST applies a Fejer Type 2 rule;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [-1,1].\n' );
  fprintf ( 1, '  Quadrature order will vary.\n' );
  fprintf ( 1, '  Integrand will vary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Order          F1              F2              F3\n' );
  fprintf ( 1, '\n' );

  for order = 1 : order_max


    result(1) = fejer2_integrate_fast ( @f1, order );
    result(2) = fejer2_integrate_fast ( @f2, order );
    result(3) = fejer2_integrate_fast ( @f3, order );

    fprintf ( 1, '  %6d  %14f  %14f  %14f\n', order, result(1:3) );

  end

  fprintf ( 1, '\n' );

  result(1) = 46.0 * sinh ( 1.0 ) / 25.0 - 2.0 * sin ( 1.0 );
  result(2) = 1.5822329637296729331;
  result(3) = ( sqrt ( 2.0 ) + 3.0 * sqrt ( 6.0 ) ) / 6.0;

  fprintf ( 1, '  Exact   %14f  %14f  %14f\n', result(1:3) );

  return
end
