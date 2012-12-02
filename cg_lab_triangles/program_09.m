function program_09 ( )

%*****************************************************************************80
%
%% PROGRAM_09: Quadrature rule integral estimate for arbitrary triangle.
%
%  Discussion:
%
%    The program
%    * reads a triangle T (defined by three points),
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
  fprintf ( 1, 'PROGRAM_09 - Quadrature rule estimates of \n' );
  fprintf ( 1, '  Integral x^p y^q\n' );
  fprintf ( 1, '  over an arbitrary triangle.\n' );
%
%  Get the triangle vertices.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a triangle T:\n' );

  t_v1 = input ( '  Enter [ T.v1.x, T.v1.y]: ' ); 
  t_v2 = input ( '  Enter [ T.v2.x, T.v2.y]: ' ); 
  t_v3 = input ( '  Enter [ T.v3.x, T.v3.y]: ' ); 
%
%  Get the powers P and Q.
%
  p = input ( 'Enter the power P for X^P:  ' );
  q = input ( 'Enter the power Q for Y^Q:  ' );
%
%
%  Compute the area.
%
  t_area = 0.5 * ( t_v1(1) * ( t_v2(2) - t_v3(2) ) ...
                 + t_v2(1) * ( t_v3(2) - t_v1(2) ) ...
                 + t_v3(1) * ( t_v1(2) - t_v2(2) ) );
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

      xi1 = rule_x(i);
      xi2 = rule_y(i);
      xi3 = 1.0 - xi1 - xi2;

      x = xi1 * t_v1(1) + xi2 * t_v2(1) + xi3 * t_v3(1);
      y = xi1 * t_v1(2) + xi2 * t_v2(2) + xi3 * t_v3(2);

      quad = quad + rule_w(i) * x^p * y^q;

    end
%
%  Normalize QUAD by the area.
%
    quad = quad * t_area;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Rule #%d\n', rule );
    fprintf ( 1, '  Estimated integral = %12.6f\n', quad );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_09\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
