function ierror = triangulation_order3_check ( node_num, triangle_num, ...
  triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_CHECK makes some simple checks on an order3 triangulation.
%
%  Discussion:
%
%    Because this routine does not receive the physical coordinates of
%    the nodes, it cannot ensure that the triangulation is maximal,
%    that is, that no more triangles can be created.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up the
%    triangles.  These should be listed in counterclockwise order.
%
%    Output, integer IERROR, error flag.
%    0, no error occurred.
%    nonzero, an error occurred, the triangulation is not valid.
%
  ierror = 0;
%
%  Checks 1 and 2:
%  NODE_NUM must be at least 3.
%  TRIANGLE_NUM must be at least 1.
%
  if ( node_num < 3 )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The number of nodes is less than 3!\n' );
    return
  end

  if ( triangle_num < 1 )
    ierror = 2;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The number of triangles is less than 1!\n' );
    return
  end
%
%  Checks 3 and 4:
%  Verify that all node values are greater than or equal to 1
%  and less than or equal to NODE_NUM.
%
  if ( any ( any ( triangle_node(1:3,1:triangle_num) < 1 ) ) )
    ierror = 3;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Some nodes are less than 1!\n' );
    return
  end

  if ( any ( any ( node_num < triangle_node(1:3,1:triangle_num) ) ) )
    ierror = 4;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Some nodes are greater than NODE_NUM!\n' );
    return
  end
%
%  Check 5:
%  Verify that every node is used at least once.
%
  used(1:node_num) = 0;

  used(triangle_node(1,1:triangle_num)) = used(triangle_node(1,1:triangle_num)) + 1;
  used(triangle_node(2,1:triangle_num)) = used(triangle_node(2,1:triangle_num)) + 1;
  used(triangle_node(3,1:triangle_num)) = used(triangle_node(3,1:triangle_num)) + 1;

  if ( any ( used(1:node_num) == 0 ) )
    ierror = 5;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Some nodes are never used as triangle vertices!\n' );
    return
  end
%
%  Check 6:
%  Verify that no node is repeated in a triangle.
%
  for i = 1 : triangle_num
    if ( triangle_node(1,i) == triangle_node(2,i) | ...
         triangle_node(2,i) == triangle_node(3,i) | ...
         triangle_node(3,i) == triangle_node(1,i) )
      ierror = 6;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
      fprintf ( 1, '  A triangle contains a null edge!\n' );
      return
    end
  end
%
%  Check 7:
%  Verify that no edge is repeated, and that repeated edges occur in
%  negated pairs.
%
  [ boundary_num, ierror ] = triangulation_order3_edge_check ( ...
    triangle_num, triangle_node );

  if ( ierror ~= 0 )
    ierror = 7;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Some edges are repeated,\n' );
    fprintf ( 1, '  or given in the wrong direction!\n' );
    return
  end
%
%  Check 8:
%  Does the triangulation satisfy Euler's criterion?
%  If not, then the triangulation is not proper.  (For instance, there
%  might be a hole in the interior.)
%
  euler = boundary_num + triangle_num + 2 - 2 * node_num;

  if ( euler ~= 0 )
    ierror = 8;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGULATION_ORDER3_CHECK - Fatal error!\n' );
    fprintf ( 1, '  The triangulation fails Euler''s criterion!\n' );
    return
  end

  return
end
