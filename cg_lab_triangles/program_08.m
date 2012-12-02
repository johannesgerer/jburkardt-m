function program_08 ( )

%*****************************************************************************80
%
%% PROGRAM_08: Quadrature rule integral estimate on the unit triangle.
%
%  Discussion:
%
%    The program
%    * reads integer exponents P and Q;
%    * it then applies three quadrature rules to estimate the
%      integral of X^P * Y^Q over the unit triangle.
%    * it prints the estimate, exact value, and error.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_08 - Quadrature rule estimates of \n' );
  fprintf ( 1, '  Integral x^p y^q\n' );
  fprintf ( 1, '  over the unit triangle.\n' );
%
%  Get the powers P and Q.
%
  p = input ( 'Enter the power P for X^P:  ' );
  q = input ( 'Enter the power Q for Y^Q:  ' );
%
%  For the  unit triangle, we know the exact value of the integral.
%
  exact = 1.0;
  for i = 1 : q
    exact = exact * i / ( p + i );
  end
  exact = exact / ( p + q + 1 ) / ( p + q + 2 );
%
%  Compute the area.
%
  t_area = 0.5;
%
%  Do for each rule.
%
  for rule = 1 : 3

    if ( rule == 1 )

      rule_order = 1;
      rule_w = [ 1.000000 ];
      rule_x = [ 0.333333 ];
      rule_y = [ 0.333333 ];

    elseif ( rule == 2 )

      rule_order = 4;
      rule_w = [ -0.562500, 0.520833, 0.520833, 0.520833 ];
      rule_x = [  0.333333, 0.600000, 0.200000, 0.200000 ];
      rule_y = [  0.333333, 0.200000, 0.600000, 0.200000 ];

    elseif ( rule == 3 )

      rule_order = 7;
      rule_w = [ ...
        0.225000, 0.125939, 0.125939, 0.125939, 0.132394, 0.132394, 0.132394 ];
      rule_x = [ ...
        0.333333, 0.797427, 0.101287, 0.101287, 0.059716, 0.470142, 0.470142 ];
      rule_y = [ ...
        0.333333, 0.101287, 0.797427, 0.101287, 0.470142, 0.059716, 0.470142 ];

    end
%
%  Generate sample points, evaluate the integrand, add to QUAD.
%
    quad = 0.0;

    for i = 1 : rule_order

      x = rule_x(i);
      y = rule_y(i);

      quad = quad + rule_w(i) * x^p * y^q;

    end
%
%  Normalize QUAD by the area.
%
    quad = quad * t_area;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule #%d\n', rule );
    fprintf ( 1, '  Estimated integral = %12.6f\n', quad );

    fprintf ( 1, '  Exact integral     = %12.6f\n', exact );
    fprintf ( 1, '  Absolute error     = %12.6f\n', abs ( exact - quad ) );
    fprintf ( 1, '  Relative error     = %12.6f\n', ...
      abs ( exact - quad ) / abs ( exact ) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_08\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
