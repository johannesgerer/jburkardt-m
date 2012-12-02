function fem2d_pack_test17 ( )

%*****************************************************************************80
%
%% TEST17 demonstrates S_L2NORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  element_num = 40;
  psi_num = element_num + 1;
  quad_num = 5;

  x_max = 1.0;
  x_min = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  S_L2NORM computes the L2 norm of a scalar function\n' );
  fprintf ( 1, '  S(X) over a region (of any dimension), assuming:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * that there is a set of finite element basis\n' );
  fprintf ( 1, '    functions PSI;\n' );
  fprintf ( 1, '  * that the region is decomposed into a number of\n' );
  fprintf ( 1, '    elements whose areas are known;\n' );
  fprintf ( 1, '  * that the integral is to be computed by a quadrature\n' );
  fprintf ( 1, '    rule applied in the same way to each element;\n' );
  fprintf ( 1, '  * that the value of the basis functions is given\n' );
  fprintf ( 1, '    at every quadrature node in every element;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our example will have one spatial dimension.\n' );
  fprintf ( 1, '  XMIN = %f\n', x_min );
  fprintf ( 1, '  XMAX = %f\n', x_max );
  fprintf ( 1, '  The number of intervals will be    %d\n', element_num );
  fprintf ( 1, '  The number of basis functions is   %d\n', psi_num );
  fprintf ( 1, '  The number of quadrature points is %d\n', quad_num );
%
%  Set the nodes.
%
  for i = 1 : psi_num
    node_x(i) = ( ( psi_num - i     ) * x_min   ...
                + (           i - 1 ) * x_max ) ...
                / ( psi_num     - 1 );
  end
%
%  Set the element "areas".
%
  for i = 1 : element_num
    element_area(i) = node_x(i+1) - node_x(i);
  end
%
%  Set the quadrature weights and abscissas.
%
  quad_weight(1) = 0.236926885056189087514264040720;
  quad_weight(2) = 0.478628670499366468041291514836;
  quad_weight(3) = 0.568888888888888888888888888889;
  quad_weight(4) = 0.478628670499366468041291514836;
  quad_weight(5) = 0.236926885056189087514264040720;

  quad_weight(1:5) = quad_weight(1:5) / 2.0;

  quad_x(1) = - 0.906179845938663992797626878299;
  quad_x(2) = - 0.538469310105683091036314420700;
  quad_x(3) =   0.0;
  quad_x(4) =   0.538469310105683091036314420700;
  quad_x(5) =   0.906179845938663992797626878299;
%
%  Set the finite element coefficients of S.  In our formulation,
%  these finite element coefficients are simply the function values
%  at the nodes.
%
  for i = 1 : psi_num
    s_coef(i) = sin ( node_x(i) );
  end
%
%  For each basis function I,
%    for each element J,
%      for each quadrature point K,
%
%  ...evaluate the basis function in the element at the quadrature point.
%
  psi_quad(1:psi_num,1:element_num,1:quad_num) = 0.0;

  for psi = 1 : psi_num

    for element = 1 : element_num

      if ( element < psi - 1 )

        continue

      elseif ( element == psi - 1 )

        xl = node_x(element);
        xr = node_x(element+1);

        for quad = 1 : quad_num

          x = ( ( 1.0 - quad_x(quad) ) * xl   ...
              + ( 1.0 + quad_x(quad) ) * xr ) ...
              /   2.0;

          psi_quad(psi,element,quad) = ( x - xl ) / ( xr - xl );

        end

      elseif ( element == psi )

        xl = node_x(element);
        xr = node_x(element+1);

        for quad = 1 : quad_num

          x = ( ( 1.0 - quad_x(quad) ) * xl   ...
              + ( 1.0 + quad_x(quad) ) * xr ) ...
              /   2.0;

          psi_quad(psi,element,quad) = ( xr - x ) / ( xr - xl );

        end

      elseif ( psi < element )
        continue
      end

    end

  end
%
%  Ask S_L2NORM to compute the integral of L2 norm of S.
%
  l2norm = s_l2norm ( psi_num, element_num, quad_num, element_area, ...
    quad_weight, psi_quad, s_coef );

  fprintf ( 1, '\n');
  fprintf ( 1, '  The computed L2 norm is %f\n', l2norm );
%
%  The integral of (sin(x))**2 is x/2 - sin(2x)/4
%
  exact = sqrt ( ...
      ( 0.5 * x_max - 0.25 * sin ( 2.0 * x_max ) ) ...
    - ( 0.5 * x_min - 0.25 * sin ( 2.0 * x_min ) ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The exact value is      %f\n', exact );

  return
end
