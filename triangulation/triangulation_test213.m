function triangulation_test213 ( )

%*****************************************************************************80
%
%% TEST213 tests TRIANGULATION_ORDER3_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2007
%
%  Author:
%
%    John Burkardt
%
  quad_num = 6;

  quad_w = [ ...
    0.1666666666666666, ...
    0.1666666666666666, ...
    0.1666666666666666, ...
    0.1666666666666666, ...
    0.1666666666666666, ...
    0.1666666666666666 ];
  quad_xy = [ ...
    0.659027622374092,  0.231933368553031; ... 
    0.659027622374092,  0.109039009072877; ... 
    0.231933368553031,  0.659027622374092; ... 
    0.231933368553031,  0.109039009072877; ... 
    0.109039009072877,  0.659027622374092; ... 
    0.109039009072877,  0.231933368553031  ]';
  test_num = 4;
  triangle_order = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST213\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_QUAD can apply a quadrature rule\n' );
  fprintf ( 1, '  to every triangle in a triangulated region,\n' );
  fprintf ( 1, '  and estimate the integral of a function over\n' );
  fprintf ( 1, '  that region.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NODE_NUM   TRI_NUM  Integral estim  Area of Region\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
%
%  Set up the grid.
%
    n = 2^( test - 1 );
    node_num = ( n + 1 ) * ( n + 1 );

    node_xy = zeros(2,node_num);

    k = 0;
    for j = 1 : n + 1
      y = ( j - 1 ) / ( n + 1 - 1 );
      for i = 1 : n + 1
        x = ( i - 1 ) / ( n + 1 - 1 );
        k = k + 1;
        node_xy(1:2,k) = [ x, y ]';
      end
    end
%
%  Set up the triangulation.
%
    triangle_num = 2 * n * n;

    triangle_node = zeros(triangle_order,triangle_num);

    k = 0;
    for j = 1 : n
      for i = 1 : n

        n11 = i     + ( j     - 1 ) * ( n + 1 );
        n12 = i     + ( j + 1 - 1 ) * ( n + 1 );
        n21 = i + 1 + ( j     - 1 ) * ( n + 1 );
        n22 = i + 1 + ( j + 1 - 1 ) * ( n + 1 );

        k = k + 1;
        triangle_node(1:triangle_order,k) = [ n11, n21, n12 ]';
        k = k + 1;
        triangle_node(1:triangle_order,k) = [ n22, n12, n21 ]';

      end
    end
%
%  Estimate the integral.
%
    [ quad_value, region_area ] = triangulation_order3_quad ( node_num, ...
      node_xy, triangle_order, triangle_num, triangle_node, @quad_fun, ...
      quad_num, quad_xy, quad_w );

    fprintf ( 1, '  %8d  %8d  %14f  %14f\n', ...
      node_num, triangle_num, quad_value, region_area );
%
%  Delete arrays.
%
    node_xy = [];
    triangle_node = [];

  end

  return
end
