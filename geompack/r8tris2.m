function [ tri_num, tri_vert, tri_nabe ] = r8tris2 ( point_num, p )

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
%    Original FORTRAN77 version by Barry Joe.
%    MATLAB version by John Burkardt.
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
%    Input, integer POINT_NUM, the number of vertices.
%
%    Input, real P(2,POINT_NUM), the vertices.
%
%    Output, integer TRI_NUM, the number of triangles in the triangulation;
%    TRI_NUM is equal to 2*POINT_NUM - NB - 2, where NB is the number
%    of boundary vertices.
%
%    Output, integer TRI_VERT(3,TRI_NUM), the nodes that make up each triangle.
%    The elements are indices of P.  The vertices of the triangles are
%    in counter clockwise order.
%
%    Output, integer TRI_NABE(3,TRI_NUM), the triangle neighbor list.
%    Positive elements are indices of TIL; negative elements are used for links
%    of a counter clockwise linked list of boundary edges; LINK = -(3*I + J-1)
%    where I, J = triangle, edge index; TRI_NABE(J,I) refers to
%    the neighbor along edge from vertex J to J+1 (mod 3).
%
  tri_num = 0;
  tri_vert = [];
  tri_nabe = [];

  tol = 100.0 * r8_epsilon ( );
%
%  Sort the vertices by increasing (x,y).
%
  indx = r82vec_sort_heap_index_a ( point_num, p );

  p = r82vec_permute ( point_num, p, indx );
%
%  Make sure that the data points are "reasonably" distinct.
%
  m1 = 1;

  for i = 2 : point_num

    m = m1;
    m1 = i;

    k = 0;

    for j = 1 : 2

      cmax = max ( abs ( p(j,m) ), abs ( p(j,m1) ) );

      if ( tol * ( cmax + 1.0 ) < abs ( p(j,m) - p(j,m1) ) )
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
      fprintf ( 1, '  X,Y(M)  = %f  %f\n', p(1,m), p(2,m) );
      fprintf ( 1, '  X,Y(M1) = %f  %f\n', p(1,m1), p(2,m1) );
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

    if ( point_num < j )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8TRIS2 - Fatal error!\n' );
      error ( 'R8TRIS2 - Fatal error!' )
      return
    end

    m = j;

    lr = lrline ( p(1,m), p(2,m), p(1,m1), p(2,m1), p(1,m2), p(2,m2), 0.0 );

    if ( lr ~= 0 )
      break
    end

    j = j + 1;

  end
%
%  Set up the triangle information for (M1,M2,M), and for any other
%  triangles you created because points were collinear with M1, M2.
%
  tri_num = j - 2;

  if ( lr == -1 )

    tri_vert(1,1) = m1;
    tri_vert(2,1) = m2;
    tri_vert(3,1) = m;
    tri_nabe(3,1) = -3;

    for i = 2 : tri_num

      m1 = m2;
      m2 = i+1;
      tri_vert(1,i) = m1;
      tri_vert(2,i) = m2;
      tri_vert(3,i) = m;
      tri_nabe(1,i-1) = -3 * i;
      tri_nabe(2,i-1) = i;
      tri_nabe(3,i) = i - 1;

    end

    tri_nabe(1,tri_num) = -3 * tri_num - 1;
    tri_nabe(2,tri_num) = -5;
    ledg = 2;
    ltri = tri_num;

  else

    tri_vert(1,1) = m2;
    tri_vert(2,1) = m1;
    tri_vert(3,1) = m;
    tri_nabe(1,1) = -4;

    for i = 2 : tri_num
      m1 = m2;
      m2 = i+1;
      tri_vert(1,i) = m2;
      tri_vert(2,i) = m1;
      tri_vert(3,i) = m;
      tri_nabe(3,i-1) = i;
      tri_nabe(1,i) = -3 * i - 3;
      tri_nabe(2,i) = i - 1;
    end

    tri_nabe(3,tri_num) = -3 * tri_num;
    tri_nabe(2,1) = -3 * tri_num - 2;
    ledg = 2;
    ltri = 1;

  end
%
%  Insert the vertices one at a time from outside the convex hull,
%  determine visible boundary edges, and apply diagonal edge swaps until
%  Delaunay triangulation of vertices (so far) is obtained.
%
  top = 0;

  for i = j+1 : point_num

    m = i;
    m1 = tri_vert(ledg,ltri);

    if ( ledg <= 2 )
      m2 = tri_vert(ledg+1,ltri);
    else
      m2 = tri_vert(1,ltri);
    end

    lr = lrline ( p(1,m), p(2,m), p(1,m1), p(2,m1), p(1,m2), p(2,m2), 0.0 );

    if ( 0 < lr ) 
      rtri = ltri;
      redg = ledg;
      ltri = 0;
    else
      l = -tri_nabe(ledg,ltri);
      rtri = floor ( l / 3 );
      redg = mod(l,3) + 1;
    end

    [ ltri, ledg, rtri, redg ] = vbedg ( p(1,m), p(2,m), point_num, p, ...
      tri_num, tri_vert, tri_nabe, ltri, ledg, rtri, redg );

    n = tri_num + 1;
    l = -tri_nabe(ledg,ltri);

    while ( 1 )

      t = floor ( l / 3 );
      e = mod ( l, 3 ) + 1;
      l = -tri_nabe(e,t);
      m2 = tri_vert(e,t);

      if ( e <= 2 )
        m1 = tri_vert(e+1,t);
      else
        m1 = tri_vert(1,t);
      end

      tri_num = tri_num + 1;
      tri_nabe(e,t) = tri_num;
      tri_vert(1,tri_num) = m1;
      tri_vert(2,tri_num) = m2;
      tri_vert(3,tri_num) = m;
      tri_nabe(1,tri_num) = t;
      tri_nabe(2,tri_num) = tri_num - 1;
      tri_nabe(3,tri_num) = tri_num + 1;
      top = top + 1;

      if ( point_num < top )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8TRIS2 - Fatal error!\n' );
        fprintf ( 1, '  Stack overflow.\n' );
        error ( 'R8TRIS2 - Fatal error!' )
      end

      work(top) = tri_num;

      if ( t == rtri & e == redg )
        break
      end

    end

    tri_nabe(ledg,ltri) = -3 * n - 1;
    tri_nabe(2,n) = -3 * tri_num - 2;
    tri_nabe(3,tri_num) = -l;
    ltri = n;
    ledg = 2;

    [ top, ltri, ledg, tri_vert, tri_nabe ] = swapec ( ...
      m, top, ltri, ledg, point_num, p, tri_num, tri_vert, tri_nabe, work );

  end
%
%  Now account for the sorting that we did.
%
  for i = 1 : 3
    for j = 1 : tri_num
      tri_vert(i,j) = indx ( tri_vert(i,j) );
    end
  end

  indx = perm_inverse ( point_num, indx );

  p = r82vec_permute ( point_num, p, indx );

  return
end
