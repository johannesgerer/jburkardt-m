function pwl_interp_2d_scattered_test01 ( )

%*****************************************************************************80
%
%% PWL_INTERP_2D_TEST01 tests R8TRIS2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2012
%
%  Author:
%
%    John Burkardt
%
  node_num = 9;
  element_order = 3;

  node_xy = [ ...
       0.0, 0.0;
       0.0, 1.0;
       0.2, 0.5;
       0.3, 0.6;
       0.4, 0.5;
       0.6, 0.4;
       0.6, 0.5;
       1.0, 0.0;
       1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_TEST01\n' );
  fprintf ( 1, '  R8TRIS2 computes the Delaunay triangulation of\n' );
  fprintf ( 1, '  a set of nodes in 2D.\n' );
%
%  Set up the Delaunay triangulation.
%
  [ element_num, triangle, element_neighbor ] = r8tris2 ( node_num, node_xy );

  triangulation_order3_print ( node_num, element_num, node_xy, ...
    triangle, element_neighbor );

  return
end

