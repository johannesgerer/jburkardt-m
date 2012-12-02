function triangulation_test217 ( )

%*****************************************************************************80
%
%% TEST217 tests TRIANGULATION_SEARCH_DELAUNAY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  node_num = 13;
  test_num = 10;
  triangle_order = 3;

  node_xy(1:dim_num,1:node_num) = [ ...
       0.0, 0.0; ...
       2.0, 2.0; ...
      -1.0, 3.0; ...
      -2.0, 2.0; ...
       8.0, 2.0; ...
       9.0, 5.0; ...
       7.0, 4.0; ...
       5.0, 6.0; ...
       6.0, 7.0; ...
       8.0, 8.0; ...
      11.0, 7.0; ...
      10.0, 4.0; ...
       6.0, 4.0 ]';


  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST217\n' );
  fprintf ( 1, '  Given a set of nodes NODE_XY, and a single point XD,\n' );
  fprintf ( 1, '  find the nearest node in NODE_XY to XD.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  POINTS_POINT_NEAR_NAIVE_ND uses a naive method.\n' );
  fprintf ( 1, '  TRIANGULATION_SEARCH_DELAUNAY finds a triangle\n' );
  fprintf ( 1, '    containing the point.  Often, one of these vertices\n' );
  fprintf ( 1, '    is the closest point.\n' );
%
%  Set up the Delaunay triangulation.
%
  [ triangle_num, triangle_node, triangle_neighbor ] = r8tris2 ( node_num, ...
    node_xy );
%
%  Get the test points.
%
  seed = 123456789;

  [ seed, xd, td ] = triangulation_order3_sample ( node_num, node_xy, ...
    triangle_num, triangle_node, test_num, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         Y       Distance     Index     Steps\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    p(1:dim_num) = xd(1:dim_num,test);

    [ nnear, dnear ] = points_point_near_naive_nd ( dim_num, node_num, ...
      node_xy, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  XD       %8.4f  %8.4f\n', p(1:dim_num) );
    fprintf ( 1, '  Naive    %8.4f  %8.4f  %8.4f  %8d\n', node_xy(1:dim_num,nnear), ...
      dnear, nnear );

    [ triangle_index, alpha, beta, gamma, edge, step_num ] = ...
      triangulation_search_delaunay ( node_num, node_xy, triangle_order, ...
      triangle_num, triangle_node, triangle_neighbor, p );

    if ( triangle_index < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Error: the search failed.\n' );
      continue
    end

    i1 = triangle_node(1,triangle_index);
    d1 = sqrt ( sum ( ( p(1:dim_num)' - node_xy(1:dim_num,i1) ).^2 ) );

    dist = d1;
    nnear = i1;

    i2 = triangle_node(2,triangle_index);
    d2 = sqrt ( sum ( ( p(1:dim_num)' - node_xy(1:dim_num,i2) ).^2 ) );

    if ( d2 < dist )
      dnear = d2;
      nnear = i2;
    end

    i3 = triangle_node(3,triangle_index);
    d3 = sqrt ( sum ( ( p(1:dim_num)' - node_xy(1:dim_num,i3) ).^2 ) );

    if ( d3 < dist )
      dnear = d3;
      nnear = i3;
    end

    fprintf ( 1, '  Delaunay %8.4f  %8.4f  %8.4f  %8d  %8d\n', node_xy(1:2,nnear), ...
      dnear, nnear, step_num );

  end

  return
end

