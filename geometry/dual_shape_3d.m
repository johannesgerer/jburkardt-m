function [ point_coord2, face_order2, face_point2 ] = dual_shape_3d ( ...
  point_num, face_num, face_order_max, point_coord, face_order, face_point, ...
  point_num2, face_num2, face_order_max2 )

%*****************************************************************************80
%
%% DUAL_SHAPE_3D constructs the dual of a shape in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points in the shape.
%
%    Input, integer FACE_NUM, the number of faces in the shape.
%
%    Input, integer FACE_ORDER_MAX, the maximum number of vertices per face.
%
%    Input, real POINT_COORD(3,POINT_NUM); POINT_COORD(*,J) is
%    the X, Y and Z coordinates of point J.
%
%    Input, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Input, integer FACE_POINT(FACE_ORDER_MAX,FACE_NUM); FACE_POINT(I,J)
%    is the index of the I-th point in the J-th face.  The
%    points are listed in the counter-clockwise direction defined
%    by the outward normal at the face.
%
%    Input, integer POINT_NUM2, the number of points in the dual.
%
%    Input, integer FACE_NUM2, the number of faces in the dual.
%
%    Input, integer FACE_ORDER_MAX2, the maximum number of vertices per face
%    in the dual.
%
%    Output, real POINT_COORD2(3,POINT_NUM2), the point coordinates
%    of the dual.
%
%    Output, integer FACE_ORDER2(FACE_ORDER_MAX2), the number of vertices 
%    per face.
%
%    Output, integer FACE_POINT2(FACE_ORDER_MAX2,FACE_NUM2), the vertices
%    of each face in the dual.
%
  dim_num = 3;
%
%  This computation should really compute the center of gravity
%  of the face, in the general case.
%
%  We'll also assume the vertices of the original and the dual
%  are to lie on the unit sphere, so we can normalize the
%  position vector of the vertex.
%
  for face = 1 : face_num

    p(1:dim_num) = 0.0;

    for j = 1 : face_order(face)
      k = face_point(j,face);
      p(1:dim_num) = p(1:dim_num) + point_coord(1:dim_num,k)';
    end

    norm = sqrt ( sum ( ( p(1:dim_num) ).^2 ) );

    point_coord2(1:dim_num,face) = p(1:dim_num)' / norm;

  end
%
%  Now build the face in the dual associated with each node FACE.
%
  for face = 1 : face_num2
%
%  Initialize the order.
%
    face_order2(face) = 0;
%
%  Find the first occurrence of FACE in an edge of polyhedron.
%
    [ irow, icol ] = i4col_find_item ( face_order_max, face_num, ...
      face_point, face );

    if ( irow <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DUAL_SHAPE_3D - Fatal error!\n' );
      fprintf ( 1, '  Could not find an edge using node %d\n', face );
      error ( 'DUAL_SHAPE_3D - Fatal error!' );
    end
%
%  Save the following node as ISTOP.
%  When we encounter ISTOP again, this will mark the end of our search.
%
    i = irow + 1;
    if ( face_order(icol) < i )
      i = 1;
    end

    istop = face_point(i,icol);
%
%  Save the previous node as INEXT.
%
    while ( 1 )

      i = irow - 1;
      if ( i < 1 )
        i = i + face_order(icol);
      end

      inext = face_point(i,icol);

      face_order2(face) = face_order2(face) + 1;

      face_point2(face_order2(face),face) = icol;
%
%  If INEXT =/= ISTOP, continue.
%
      if ( inext == istop )
        break
      end
%
%  Set IPREV:= INEXT.
%
      iprev = inext;
%
%  Search for the occurrence of the edge FACE-IPREV.
%
      [ irow, icol ] = i4col_find_pair_wrap ( face_order_max, face_num, ...
        face_point, face, iprev );

      if ( irow <= 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DUAL_SHAPE_3D - Fatal error!\n' );
        fprintf ( 1, '  No edge from node %d\n', iprev );
        fprintf ( 1, '  to node %d\n', face );
        error ( 'DUAL_SHAPE_3D - Fatal error!' );
      end

    end

  end

  return
end
