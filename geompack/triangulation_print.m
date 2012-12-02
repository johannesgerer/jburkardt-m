function triangulation_print ( point_num, tri_num, xc, tri_vert, tri_nabe )

%*****************************************************************************80
%
%% TRIANGULATION_PRINT prints out information defining a Delaunay triangulation.
%
%  Discussion:
%
%    Triangulations created by RTRIS include extra information encoded
%    in the negative values of TRI_NABE.
%
%    Because some of the nodes counted in POINT_NUM may not actually be
%    used in the triangulation, I needed to compute the true number
%    of vertices.  I added this calculation on 13 October 2001.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer TRI_NUM, the number of triangles.
%
%    Input, real XC(2,POINT_NUM), the point coordinates.
%
%    Input, integer TRI_VERT(3,TRI_NUM), the nodes that make up the triangles.
%
%    Input, integer TRI_NABE(3,TRI_NUM), the triangle neighbors on each side.
%    If there is no triangle neighbor on a particular side, the value of
%    TRI_NABE should be negative.  If the triangulation data was created by
%    DTRIS2, then there is more information encoded in the negative values.
%
  ndim = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATION_PRINT\n' );
  fprintf ( 1, '  Information defining a triangulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of points is %d\n', point_num );

  r8mat_transpose_print ( ndim, point_num, xc, '  Point coordinates' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of triangles is %d\n', tri_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sets of three points are used as vertices of\n' );
  fprintf ( 1, '  the triangles.  For each triangle, the points\n' );
  fprintf ( 1, '  are listed in counterclockwise order.\n' );

  i4mat_transpose_print ( 3, tri_num, tri_vert, '  Triangle nodes:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  On each side of a given triangle, there is either\n' );
  fprintf ( 1, '  another triangle, or a piece of the convex hull.\n' );
  fprintf ( 1, '  For each triangle, we list the indices of the three\n' );
  fprintf ( 1, '  neighbors, or (if negative) the codes of the\n' );
  fprintf ( 1, '  segments of the convex hull.\n' );

  i4mat_transpose_print ( 3, tri_num, tri_nabe, '  Triangle neighbors' );
%
%  Determine the number of vertices.  This is not the same as the
%  number of points!
%
  vertex_list(          1:  tri_num) = tri_vert(1,1:tri_num);
  vertex_list(  tri_num+1:2*tri_num) = tri_vert(2,1:tri_num);
  vertex_list(2*tri_num+1:3*tri_num) = tri_vert(3,1:tri_num);

  vertex_list = i4vec_sort_heap_a ( 3*tri_num, vertex_list );

  [ vertex_num, vertex_list ] = i4vec_sorted_unique ( 3*tri_num, vertex_list );
%
%  Determine the number of boundary points.
%
  boundary_num = 2 * vertex_num - tri_num - 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of boundary points is %d\n', boundary_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The segments that make up the convex hull can be\n' );
  fprintf ( 1, '  determined from the negative entries of the triangle\n' );
  fprintf ( 1, '  neighbor list.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  # Tri Side  N1  N2\n' );
  fprintf ( 1, '\n' );

  skip = 0;

  k = 0;

  for i = 1 : tri_num

    for j = 1 : 3

      if ( tri_nabe(j,i) < 0 )
          
        s = - tri_nabe(j,i);
        t = floor ( s / 3 );

        if ( t < 1 | tri_num < t )
          fprintf ( 1, '\n' );
          fprintf ( 1, '  Sorry, this data does not use the DTRIS2\n' );
          fprintf ( 1, '  convention for convex hull segments.\n' );
          skip = 1;
          break
        end

        s = mod ( s, 3 ) + 1;
        k = k + 1;
        n1 = tri_vert(s,t);
        n2 = tri_vert(i4_wrap(s+1,1,3),t);
        fprintf ( 1, '  %4d  %4d  %4d  %4d  %4d\n', k, t, s, n1, n2 );
      end

    end

    if ( skip )
      break
    end

  end

  return
end
