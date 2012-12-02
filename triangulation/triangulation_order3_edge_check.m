function [ boundary_num, ierror ] = triangulation_order3_edge_check ( ...
  triangle_num, triangle_node )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_EDGE_CHECK checks the edges of a triangulation.
%
%  Discussion:
%
%    This routine was rewritten to use columns rather than rows.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up each triangle.
%
%    Output, integer BOUNDARY_NUM, the number of edges that lie on the boundary.
%
%    Output, integer IERROR, an error flag.
%    0, no errors were detected.
%    nonzero, an error occurred.
%
  ierror = 0;
%
%  Step 1.
%  From the list of nodes for triangle T, of the form: (I,J,K)
%  construct the three neighbor relations:
%
%    (I,J,+1) or (J,I,-1),
%    (J,K,+1) or (K,J,-1),
%    (K,I,+1) or (I,K,-1)
%
%  where we choose (I,J,+1) if I < J, or else (J,I,-1) and so on.
%
  for tri = 1 : triangle_num

    i = triangle_node(1,tri);
    j = triangle_node(2,tri);
    k = triangle_node(3,tri);

    if ( i < j )
      col(1:3,3*(tri-1)+1) = [ i, j, +1 ]';
    else
      col(1:3,3*(tri-1)+1) = [ j, i, -1 ]';
    end

    if ( j < k )
      col(1:3,3*(tri-1)+2) = [ j, k, +1 ]';
    else
      col(1:3,3*(tri-1)+2) = [ k, j, -1 ]';
    end

    if ( k < i )
      col(1:3,3*(tri-1)+3) = [ k, i, +1 ]';
    else
      col(1:3,3*(tri-1)+3) = [ i, k, -1 ]';
    end

  end
%
%  Step 2. Perform an ascending dictionary sort on the neighbor relations.
%
  col = i4col_sort_a ( 3, 3*triangle_num, col );
%
%  Step 3.
%
%  If any record occurs twice, we have an error.
%  Unpaired records lie on the convex hull.
%
  i = 0;
  boundary_num = 0;

  while ( i < 3 * triangle_num )

    i = i + 1;

    if ( i == 3 * triangle_num )

      boundary_num = boundary_num + 1;

    else

      if ( all ( col(1:2,i) == col(1:2,i+1) ) )

        if ( col(3,i) == col(3,i+1) )
          ierror = 1;
          fprintf ( 1, '\n' );
          fprintf ( 1, 'TRIANGULATION_ORDER3_EDGE_CHECK - Warning!\n' );
          fprintf ( 1, '  An edge occurs twice.\n' );
        else
          i = i + 1;
        end

      else

        boundary_num = boundary_num + 1;

      end
    end
  end

  return
end
