function [ first, list ] = voronoi_polygons ( n, face_num, face )

%*****************************************************************************80
%
%% VORONOI_POLYGONS computes the Voronoi polygons.
%
%  Discussion:
%
%    We are given information defining the Delaunay triangulation of
%    a set of N points on the unit sphere.  
%
%    The Voronoi polygon around a given point can be found by considering 
%    the union all the Delaunay triangles that include the given point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 December 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer FACE_NUM, the number of Delaunay triangles.
%
%    Input, integer FACE(3,FACE_NUM), the indices of points that
%    form each Delaunay triangle.
%
%    Output, integer FIRST(N+1), for each polygon, points to the location
%    in LIST of the index.
%
%    Output, integer LIST(2*FACE_NUM), the list of vertices that form each 
%    polygon.
%
  first = zeros ( n + 1, 1 );
  list = zeros ( 2 * face_num, 1 );

  used = 0;
%
%  For each point...
%
  for p0 = 1 : n

    first(p0) = used + 1;
%
%  ...find any triangle that indexes P0...
%
    p1 = 0;

    for f = 1 : face_num
      if ( face(1,f) == p0 )
        p1 = face(2,f);
        p2 = face(3,f);
        t = f;
        break;
      elseif ( face(2,f) == p0 )
        p1 = face(3,f);
        p2 = face(1,f);
        t = f;
        break;
      elseif ( face(3,f) == p0 )
        p1 = face(1,f);
        p2 = face(2,f);
        t = f;
        break;
      end
    end
%
%  No such triangle?
%
    if ( p1 == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'VORONOI_POLYGON - Fatal error!' );
      fprintf ( 1, '  For the point P0 = %d\n', p0 );
      fprintf ( 1, '  there is no triangle of the form (P0,P1,P2).\n' );
      error ( 'VORONOI_POLYGON - Fatal error!' )
    end
%
%  We found triangle (P0,P1,P2).
%
    pstop = p1;
%
%  Vertex F begins the first edge.
%
    used = used + 1;
    list(used) = f;
%
%  Set P1 <= P2, and search for another triangle of the form (P0,P1,P2).
%
    while ( 1 )

      p1 = p2;
      p2 = 0;

      for f = 1 : face_num
        if ( face(1,f) == p0 && face(2,f) == p1 )
          p2 = face(3,f);
          t = f;
          break;
        elseif ( face(2,f) == p0 && face(3,f) == p1 )
          p2 = face(1,f);
          t = f;
          break;
        elseif ( face(3,f) == p0 && face(1,f) == p1 )
          p2 = face(2,f);
          t = f;
          break;
        end
      end

      if ( p2 == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'VORONOI_POLYGON - Fatal error!' );
      fprintf ( 1, '  For the points P0 = %d, P1 = %d\n', p0, p1 );
      fprintf ( 1, '  there is no triangle of the form (P0,P1,P2).\n' );
        error ( 'VORONOI_POLYGON - Fatal error!' )
      end

      used = used + 1;
      list(used) = f;
%
%  Stop when we have returned to the first vertex.
%
      if ( p2 == pstop )
        break
      end

    end

  end

  first(n+1) = used + 1;

  return
end
