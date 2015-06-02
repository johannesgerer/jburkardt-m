function [ triangle_num, triangle_node, triangle_neighbor ] = r8tris2 ( ...
  node_num, node_xy )

%*****************************************************************************80
%
%% R8TRIS2 constructs a Delaunay triangulation of 2D vertices.
%
%  Discussion:
%
%    The routine constructs the Delaunay triangulation of a set of 2D vertices
%    using an incremental approach and diagonal edge swaps.  Vertices are
%    first sorted in lexicographically increasing (X,Y) order, and
%    then are inserted one at a time from outside the convex hull.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe,
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Output, integer TRIANGLE_NUM, the number of triangles in the triangulation;
%    TRIANGLE_NUM is equal to 2*NODE_NUM - BOUNDARY_NUM - 2, where BOUNDARY_NUM 
%    is the number of boundary vertices.
%
%    Output, integer TRIANGLE_NODE(3,TRIANGLE_NUM), the nodes that make up each triangle.
%    The elements are indices of P.  The vertices of the triangles are
%    in counter clockwise order.
%
%    Output, integer TRIANGLE_NEIGHBOR(3,TRIANGLE_NUM), the triangle neighbor list.
%    Positive elements are indices of TIL; negative elements are used for links
%    of a counter clockwise linked list of boundary edges; LINK = -(3*I + J-1)
%    where I, J = triangle, edge index; TRIANGLE_NEIGHBOR(J,I) refers to
%    the neighbor along edge from vertex J to J+1 (mod 3).
%
  triangle_num = 0;
  triangle_node = [];
  triangle_neighbor = [];

  tol = 100.0 * eps;
%
%  Sort the vertices by increasing (x,y).
%
  indx = r82vec_sort_heap_index_a ( node_num, node_xy );

  node_xy = r82vec_permute ( node_num, node_xy, indx );
%
%  Make sure that the data points are "reasonably" distinct.
%
  m1 = 1;

  for i = 2 : node_num

    m = m1;
    m1 = i;

    k = 0;

    for j = 1 : 2

      cmax = max ( abs ( node_xy(j,m) ), abs ( node_xy(j,m1) ) );

      if ( tol * ( cmax + 1.0 ) < abs ( node_xy(j,m) - node_xy(j,m1) ) )
        k = j;
        break
      end

    end

    if ( k == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8TRIS2 - Fatal error!\n' );
      fprintf ( 1, '  Fails for point number I = %d\n', i );
      fprintf ( 1, '  M = %d\n', m );
      fprintf ( 1, '  M1 = %d\n', m1 );
      fprintf ( 1, '  X,Y(M)  = %f  %f\n', node_xy(1,m), node_xy(2,m) );
      fprintf ( 1, '  X,Y(M1) = %f  %f\n', node_xy(1,m1), node_xy(2,m1) );
      error ( 'R8TRIS2 - Fatal error!' )
      return
    end

  end
%
%  Starting from points M1 and M2, search for a third point M that
%  makes a "healthy" triangle (M1,M2,M)
%
  m1 = 1;
  m2 = 2;
  j = 3;

  while ( 1 )

    if ( node_num < j )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8TRIS2 - Fatal error!\n' );
      error ( 'R8TRIS2 - Fatal error!' )
      return
    end

    m = j;

    lr = lrline ( node_xy(1,m), node_xy(2,m), node_xy(1,m1), node_xy(2,m1), ...
      node_xy(1,m2), node_xy(2,m2), 0.0 );

    if ( lr ~= 0 )
      break
    end

    j = j + 1;

  end
%
%  Set up the triangle information for (M1,M2,M), and for any other
%  triangles you created because points were collinear with M1, M2.
%
  triangle_num = j - 2;

  if ( lr == -1 )

    triangle_node(1,1) = m1;
    triangle_node(2,1) = m2;
    triangle_node(3,1) = m;
    triangle_neighbor(3,1) = -3;

    for i = 2 : triangle_num

      m1 = m2;
      m2 = i+1;
      triangle_node(1,i) = m1;
      triangle_node(2,i) = m2;
      triangle_node(3,i) = m;
      triangle_neighbor(1,i-1) = -3 * i;
      triangle_neighbor(2,i-1) = i;
      triangle_neighbor(3,i) = i - 1;

    end

    triangle_neighbor(1,triangle_num) = -3 * triangle_num - 1;
    triangle_neighbor(2,triangle_num) = -5;
    ledg = 2;
    ltri = triangle_num;

  else

    triangle_node(1,1) = m2;
    triangle_node(2,1) = m1;
    triangle_node(3,1) = m;
    triangle_neighbor(1,1) = -4;

    for i = 2 : triangle_num
      m1 = m2;
      m2 = i+1;
      triangle_node(1,i) = m2;
      triangle_node(2,i) = m1;
      triangle_node(3,i) = m;
      triangle_neighbor(3,i-1) = i;
      triangle_neighbor(1,i) = -3 * i - 3;
      triangle_neighbor(2,i) = i - 1;
    end

    triangle_neighbor(3,triangle_num) = -3 * triangle_num;
    triangle_neighbor(2,1) = -3 * triangle_num - 2;
    ledg = 2;
    ltri = 1;

  end
%
%  Insert the vertices one at a time from outside the convex hull,
%  determine visible boundary edges, and apply diagonal edge swaps until
%  Delaunay triangulation of vertices (so far) is obtained.
%
  top = 0;

  for i = j+1 : node_num

    m = i;
    m1 = triangle_node(ledg,ltri);

    if ( ledg <= 2 )
      m2 = triangle_node(ledg+1,ltri);
    else
      m2 = triangle_node(1,ltri);
    end

    lr = lrline ( node_xy(1,m), node_xy(2,m), node_xy(1,m1), node_xy(2,m1), ...
      node_xy(1,m2), node_xy(2,m2), 0.0 );

    if ( 0 < lr ) 
      rtri = ltri;
      redg = ledg;
      ltri = 0;
    else
      l = -triangle_neighbor(ledg,ltri);
      rtri = floor ( l / 3 );
      redg = mod(l,3) + 1;
    end

    [ ltri, ledg, rtri, redg ] = vbedg ( node_xy(1,m), node_xy(2,m), node_num, node_xy, ...
      triangle_num, triangle_node, triangle_neighbor, ltri, ledg, rtri, redg );

    n = triangle_num + 1;
    l = -triangle_neighbor(ledg,ltri);

    while ( 1 )

      t = floor ( l / 3 );
      e = mod ( l, 3 ) + 1;
      l = -triangle_neighbor(e,t);
      m2 = triangle_node(e,t);

      if ( e <= 2 )
        m1 = triangle_node(e+1,t);
      else
        m1 = triangle_node(1,t);
      end

      triangle_num = triangle_num + 1;
      triangle_neighbor(e,t) = triangle_num;
      triangle_node(1,triangle_num) = m1;
      triangle_node(2,triangle_num) = m2;
      triangle_node(3,triangle_num) = m;
      triangle_neighbor(1,triangle_num) = t;
      triangle_neighbor(2,triangle_num) = triangle_num - 1;
      triangle_neighbor(3,triangle_num) = triangle_num + 1;
      top = top + 1;

      if ( node_num < top )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8TRIS2 - Fatal error!\n' );
        fprintf ( 1, '  Stack overflow.\n' );
        error ( 'R8TRIS2 - Fatal error!' )
      end

      work(top) = triangle_num;

      if ( t == rtri & e == redg )
        break
      end

    end

    triangle_neighbor(ledg,ltri) = -3 * n - 1;
    triangle_neighbor(2,n) = -3 * triangle_num - 2;
    triangle_neighbor(3,triangle_num) = -l;
    ltri = n;
    ledg = 2;

    [ top, ltri, ledg, triangle_node, triangle_neighbor ] = swapec ( ...
      m, top, ltri, ledg, node_num, node_xy, triangle_num, triangle_node, ...
      triangle_neighbor, work );

  end
%
%  Now account for the sorting that we did.
%
  for i = 1 : 3
    for j = 1 : triangle_num
      triangle_node(i,j) = indx ( triangle_node(i,j) );
    end
  end

  indx = perm_inverse ( node_num, indx );

  node_xy = r82vec_permute ( node_num, node_xy, indx );

  return
end
