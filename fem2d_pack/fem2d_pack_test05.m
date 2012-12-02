function fem2d_pack_test05 ( )

%*****************************************************************************80
%
%% TEST05 demonstrates DERIVATIVE_AVERAGE_T3.
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
  element_order = 3;
  nelemx = 7;
  nelemy = 5;

  element_num = grid_t3_element_num ( nelemx, nelemy );
  node_num = grid_t3_node_num ( nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  DERIVATIVE_AVERAGE_T3 averages the spatial derivatives\n' );
  fprintf ( 1, '  of a finite element function at the nodes.\n' );

  element_node = grid_t3_element ( nelemx, nelemy );
%
% Generate the coordinates of the nodes.
%
  node = 0;

  for row = 0 : nelemy

    r = ( ( nelemy - row ) *  1.0   ...
        + (        + row ) *  3.0 ) ...
        /   nelemy;

    for col = 0 : nelemx

      node = node + 1;
      angle = ( ( nelemx - col ) * 135.0   ...
              + (        + col ) *  45.0 ) ...
              /   nelemx;

      angle = degrees_to_radians ( angle );

      node_xy(1,node) = r * cos ( angle );
      node_xy(2,node) = r * sin ( angle );

    end

  end
%
%  Set the finite element function.
%
  for node = 1 : node_num
    x = node_xy(1,node);
    y = node_xy(2,node);
    c(node) = sin ( x ) * ( 1.0 + y * y );
  end

  [ dcdx, dcdy ] = derivative_average_t3 ( node_num, node_xy, element_num, ...
    element_node, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  C         X               Y\n' );
  fprintf ( 1, '         dCdX(computed)  dCdY(computed)\n' );
  fprintf ( 1, '         dCdX(exact)     dCdY(exact)\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num

    x = node_xy(1,node);
    y = node_xy(2,node);
    
    dcdx_exact = cos ( x ) * ( 1.0 * y * y );
    dcdy_exact = sin ( x ) * 2.0 * y;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14f  %14f  %14f\n', c(node), node_xy(1:2,node) );
    fprintf ( 1, '                %14f  %14f\n', dcdx(node), dcdy(node) );
    fprintf ( 1, '                %14f  %14f\n', dcdx_exact, dcdy_exact );

  end

  return
end

