function [ node_xyz, face_order, face_node, normal_vector, vertex_normal ] = ...
  obj_read ( input_file_name, node_num, face_num, normal_num, order_max )

%*****************************************************************************80
%
%% OBJ_READ reads graphics information from a Wavefront OBJ file.
%
%  Discussion:
%
%    It is intended that the information read from the file can
%    either start a whole new graphics object, or simply be added
%    to a current graphics object via the '<<' command.
%
%    This is controlled by whether the input values have been zeroed
%    out or not.  This routine simply tacks on the information it
%    finds to the current graphics object.
%
%  Example:
%
%    #  magnolia.obj
%
%    v -3.269770 -39.572201 0.876128
%    v -3.263720 -39.507999 2.160890
%    ...
%    v 0.000000 -9.988540 0.000000
%    vn 1.0 0.0 0.0
%    ...
%    vn 0.0 1.0 0.0
%
%    f 8 9 11 10
%    f 12 13 15 14
%    ...
%    f 788 806 774
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer NORMAL_NUM, the number of normal vectors.
%
%    Input, integer ORDER_MAX, the maximum number of vertices per face.
%
%    Output, real ( kind = 8 ) NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Output, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Output, integer FACE_NODE(ORDER_MAX,FACE_NUM), the nodes making faces.
%
%    Output, real ( kind = 8 ) NORMAL_VECTOR(3,NORMAL_NUM), normal vectors.
%
%    Output, integer VERTEX_NORMAL(ORDER_MAX,FACE_NUM), the indices of normal
%    vectors per vertex.
%
  ierror = 0;

  face = 0;
  node = 0;
  normal = 0;
  text_num = 0;

  face_node = zeros ( order_max, face_num );
  face_order = zeros ( face_num, 1 );
  node_xyz = zeros ( 3, node_num );
  normal_vector = zeros ( 3, normal_num );
  vertex_normal = zeros ( order_max, face_num );
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII OBJ file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'OBJ_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'OBJ_READ - Fatal error!' );
    return
  end
%
%  Read a line of text from the file.
%
  while ( 1 )

    text = fgetl ( input_file_unit );

    if ( text == -1 )
      break
    end

    text_num = text_num + 1;
%
%  Replace any control characters (in particular, TAB's) by blanks.
%
    s_control_blank ( text );

    done = 1;
    word_index = 0;
%
%  Read a word from the line.
%
    [ word, done ] = word_next_read ( text, done );
%
%  If no more words in this line, read a new line.
%
    if ( done )
      continue
    end
%
%  If this word begins with '#' or '$', then it's a comment.  Read a new line.
%
    if ( word(1) == '#' || word(1) == '$' )
      continue
    end

    word_index = word_index + 1;

    if ( word_index == 1 )
      word_one = word;
    end
%
%  BEVEL
%  Bevel interpolation.
%
    if ( s_eqi ( word_one, 'BEVEL' ) )
%
%  BMAT
%  Basis matrix.
%
    elseif ( s_eqi ( word_one, 'BMAT' ) )
%
%  C_INTERP
%  Color interpolation.
%
    elseif ( s_eqi ( word_one, 'C_INTERP' ) )
%
%  CON
%  Connectivity between free form surfaces.
%
    elseif ( s_eqi ( word_one, 'CON' ) )
%
%  CSTYPE
%  Curve or surface type.
%
    elseif ( s_eqi ( word_one, 'CSTYPE' ) )
%
%  CTECH
%  Curve approximation technique.
%
    elseif ( s_eqi ( word_one, 'CTECH' ) )
%
%  CURV
%  Curve.
%
    elseif ( s_eqi ( word_one, 'CURV' ) )
%
%  CURV2
%  2D curve.
%
    elseif ( s_eqi ( word_one, 'CURV2' ) )
%
%  D_INTERP
%  Dissolve interpolation.
%
    elseif ( s_eqi ( word_one, 'D_INTERP' ) )
%
%  DEG
%  Degree.
%
    elseif ( s_eqi ( word_one, 'DEG' ) )
%
%  END
%  End statement.
%
    elseif ( s_eqi ( word_one, 'END' ) )
%
%  F V1 V2 V3 ...
%    or
%  F V1/VT1/VN1 V2/VT2/VN2 ...
%    or
%  F V1//VN1 V2//VN2 ...
%
%  Face.
%  A face is defined by the vertices.
%  Optionally, slashes may be used to include the texture vertex
%  and vertex normal indices.
%
    elseif ( s_eqi ( word_one, 'F' ) )

      face = face + 1;

      vertex = 0;

      while ( 1 )

        [ word, done ] = word_next_read ( text, done );

        if ( done )
          break
        end

        vertex = vertex + 1;
        order_max = max ( order_max, vertex );
%
%  Locate the slash characters in the word, if any.
%
        i1 = ch_index ( word, '/' );
        if ( 0 < i1 )
          i2 = ch_index ( word(i1+1), '/' ) + i1;
        else
          i2 = 0;
        end
%
%  Read the vertex index.
%
        itemp = s_to_i4 ( word );

        face_node(vertex,face) = itemp;
        face_order(face) = face_order(face) + 1;
%
%  If there are two slashes, then read the data following the second one.
%
        if ( 0 < i2 )

          itemp = s_to_i4 ( word(i2+1) );

          vertex_normal(vertex,face) = itemp;

        end

      end
%
%  G
%  Group name.
%
    elseif ( s_eqi ( word_one, 'G' ) )
%
%  HOLE
%  Inner trimming loop.
%
    elseif ( s_eqi ( word_one, 'HOLE' ) )
%
%  L
%  A line, described by a sequence of vertex indices.
%  Are the vertex indices 0 based or 1 based?
%
    elseif ( s_eqi ( word_one, 'L' ) )
%
%  LOD
%  Level of detail.
%
    elseif ( s_eqi ( word_one, 'LOD' ) )
%
%  MG
%  Merging group.
%
    elseif ( s_eqi ( word_one, 'MG' ) )
%
%  MTLLIB
%  Material library.
%
    elseif ( s_eqi ( word_one, 'MTLLIB' ) )
%
%  O
%  Object name.
%
    elseif ( s_eqi ( word_one, 'O' ) )
%
%  P
%  Point.
%
    elseif ( s_eqi ( word_one, 'P' ) )
%
%  PARM
%  Parameter values.
%
    elseif ( s_eqi ( word_one, 'PARM' ) )
%
%  S
%  Smoothing group.
%
    elseif ( s_eqi ( word_one, 'S' ) )
%
%  SCRV
%  Special curve.
%
    elseif ( s_eqi ( word_one, 'SCRV' ) )
%
%  SHADOW_OBJ
%  Shadow casting.
%
    elseif ( s_eqi ( word_one, 'SHADOW_OBJ' ) )
%
%  SP
%  Special point.
%
    elseif ( s_eqi ( word_one, 'SP' ) )
%
%  STECH
%  Surface approximation technique.
%
    elseif ( s_eqi ( word_one, 'STECH' ) )
%
%  STEP
%  Stepsize.
%
    elseif ( s_eqi ( word_one, 'STEP' ) )
%
%  SURF
%  Surface.
%
    elseif ( s_eqi ( word_one, 'SURF' ) )
%
%  TRACE_OBJ
%  Ray tracing.
%
    elseif ( s_eqi ( word_one, 'TRACE_OBJ' ) )
%
%  TRIM
%  Outer trimming loop.
%
    elseif ( s_eqi ( word_one, 'TRIM' ) )
%
%  USEMTL
%  Material name.
%
    elseif ( s_eqi ( word_one, 'USEMTL' ) )
%
%  V X Y Z
%  Geometric vertex.
%
    elseif ( s_eqi ( word_one, 'V' ) )

      node = node + 1;

      for i = 1 : 3
        [ word, done ] = word_next_read ( text, done );
        temp = s_to_r8 ( word );
        node_xyz(i,node) = temp;
      end
%
%  VN
%  Vertex normals.
%
    elseif ( s_eqi ( word_one, 'VN' ) )

      normal = normal + 1;

      for i = 1 : 3
        [ word, done ] = word_next_read ( text, done );
        temp = s_to_r8 ( word );
        normal_vector(i,normal) = temp;
      end
%
%  VT
%  Vertex texture.
%
    elseif ( s_eqi ( word_one, 'VT' ) )
%
%  VP
%  Parameter space vertices.
%
    elseif ( s_eqi ( word_one, 'VP' ) )
%
%  Unrecognized keyword.
%
    else

    end

  end

  fclose ( input_file_unit );

  return
end
